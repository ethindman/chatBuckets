class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :question_lists, dependent: :destroy

  has_many :cards, dependent: :destroy

  has_attached_file :image, styles: { medium: "150x150#", small: "85x85#", thumb: "35x35#" }, default_url: "paperclip/:style/missing-user-image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def feed
    # r = Relationship.arel_table
    # t = Card.arel_table
    # sub_query = t[:user_id].in(r.where(r[:follower_id].eq(id)).project(r[:followed_id]))
    # Tweet.where(sub_query.or(t[:user_id].eq(id)))
  end

end
