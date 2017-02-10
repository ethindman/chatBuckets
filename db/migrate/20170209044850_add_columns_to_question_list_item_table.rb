class AddColumnsToQuestionListItemTable < ActiveRecord::Migration
  def change
    add_column :question_list_items, :my_response, :text
    add_column :question_list_items, :question_variations, :text
  end
end
