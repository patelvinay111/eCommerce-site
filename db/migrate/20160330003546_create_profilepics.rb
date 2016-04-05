class CreateProfilepics < ActiveRecord::Migration
   def change
    create_table :profilepics do |t|
    

      t.timestamps null: false
    end
  end
end
