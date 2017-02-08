class QuestionListItem < ActiveRecord::Base
  belongs_to :question_list

  validates :content, presence: true, length: { in: 2..75 }

end
