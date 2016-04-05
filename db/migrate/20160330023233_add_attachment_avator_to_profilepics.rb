class AddAttachmentAvatorToProfilepics < ActiveRecord::Migration
  def self.up
    change_table :profilepics do |t|
      t.attachment :avator
    end
  end

  def self.down
    remove_attachment :profilepics, :avator
  end
end
