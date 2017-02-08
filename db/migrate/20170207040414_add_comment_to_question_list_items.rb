class AddCommentToQuestionListItems < ActiveRecord::Migration
  def change
    add_column :question_list_items, :translation, :string
    add_column :question_list_items, :notes, :text
  end
end
