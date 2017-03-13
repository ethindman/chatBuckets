class AddUserIdToJournal < ActiveRecord::Migration[5.0]
  def change
    add_column :journals, :user_id, :integer
  end
end
