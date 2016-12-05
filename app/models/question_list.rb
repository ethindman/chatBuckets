class QuestionList < ActiveRecord::Base
  belongs_to :user
  has_many :question_list_items, dependent: :destroy
end
