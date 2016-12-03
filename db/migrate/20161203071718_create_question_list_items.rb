class CreateQuestionListItems < ActiveRecord::Migration
  def change
    create_table :question_list_items do |t|
      t.string :content
      t.references :question_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
