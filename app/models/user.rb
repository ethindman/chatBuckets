class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :question_lists, dependent: :destroy

  has_attached_file :image, styles: { medium: "250x250#", thumb: "150x150#" }, default_url: "paperclip/:style/missing-user-image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
