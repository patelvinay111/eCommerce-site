class AddPaperclipToUser < ActiveRecord::Migration
  def up
    add_attachment :users, :paperclip
  end

  def down
    #remove_attachment :users, :image
    remove_attachment :users, :paperclip
  end 

  def change
  end

end
