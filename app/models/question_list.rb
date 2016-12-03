class QuestionList < ActiveRecord::Base
  has_many :question_list_items, dependent: :destroy
end
