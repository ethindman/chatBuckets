class AddUserIdToQuestionLists < ActiveRecord::Migration
  def change
    add_column :question_lists, :user_id, :integer
  end
end
