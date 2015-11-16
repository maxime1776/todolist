class AddAttachmentPictureToGears < ActiveRecord::Migration
  def self.up
    change_table :gears do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :gears, :picture
  end
end
