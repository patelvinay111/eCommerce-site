class RemoveConfirmpasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :confirmpassword, :string
  end
   def up
    remove_column :users, :confirmpassword
  end

  def down
    add_column :users, :confirmpassword, :string
  end
end
