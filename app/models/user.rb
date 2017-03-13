class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { medium: "150x150#", small: "85x85#", thumb: "35x35#" }, default_url: "paperclip/:style/missing-user-image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :username, uniqueness: true
  validates :native_language, presence: true
  validates :language_of_study, presence: true

  ENUM_LANGUAGES = [
    :english,
    :japanese,
    :french,
    :spanish,
  ]

  enum native_language: ENUM_LANGUAGES, _prefix: :native_lang
  enum language_of_study: ENUM_LANGUAGES

  # Relationships
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # Question lists, cards and journals
  has_many :question_lists, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :journals, dependent: :destroy

  def feed
    r = Relationship.arel_table
    t = Card.arel_table
    sub_query = t[:user_id].in(r.where(r[:follower_id].eq(id)).project(r[:followed_id]))
    # Card.where(sub_query.or(t[:user_id].eq(id))) #Following cards + current_user cards
    Card.where(sub_query) # Only following cards
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

end
