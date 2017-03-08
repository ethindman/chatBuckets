class FixCardColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :cards, :sentence, :body
  end
end
