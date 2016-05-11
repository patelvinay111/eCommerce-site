class AddUserToProfilepic < ActiveRecord::Migration
def self.up
    add_column :profilepics, :user_id, :integer
  end

  def self.down
    remove_column :profilepics, :user_id, :integer
  end
 
end
