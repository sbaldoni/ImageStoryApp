class AddAttachmentPictureToBeats < ActiveRecord::Migration
  def self.up
    change_table :beats do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :beats, :picture
  end
end
