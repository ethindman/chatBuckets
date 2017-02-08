class QuestionList < ActiveRecord::Base
  belongs_to :user
  has_many :question_list_items, dependent: :destroy

  validates :title, presence: true, length: { in: 2..75 }

end
