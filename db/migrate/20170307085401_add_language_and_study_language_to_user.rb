class AddLanguageAndStudyLanguageToUser < ActiveRecord::Migration
  def change
    add_column :users, :native_language, :integer, default: 0
    add_column :users, :language_of_study, :integer, default: 0
  end
end
