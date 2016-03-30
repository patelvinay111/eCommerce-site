class AddAttachmentPaperclipToUsers < ActiveRecord::Migration
  def self.up
   change_table :users do |t|
      t.attachment :paperclip
    end

    end
  end

  def self.down
    remove_attachment :users, :paperclip
  end
end
