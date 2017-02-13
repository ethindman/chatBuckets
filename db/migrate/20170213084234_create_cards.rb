class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :sentence
      t.text :translation
      t.text :variations
      t.text :my_response
      t.integer :user_id
      t.integer :bucket_id

      t.timestamps null: false
    end
  end
end
