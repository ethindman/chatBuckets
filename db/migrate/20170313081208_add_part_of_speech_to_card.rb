class AddPartOfSpeechToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :part_of_speech, :integer, default: 0
  end
end
