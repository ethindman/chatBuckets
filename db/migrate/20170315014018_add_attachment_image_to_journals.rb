class AddAttachmentImageToJournals < ActiveRecord::Migration
  def self.up
    change_table :journals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :journals, :image
  end
end
