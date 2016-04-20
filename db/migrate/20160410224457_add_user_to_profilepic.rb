class AddUserToProfilepic < ActiveRecord::Migration
  def change
    add_reference :profilepics, :user, index: true, foreign_key: true
  end
end
