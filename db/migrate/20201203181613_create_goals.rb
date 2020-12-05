class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t| 
      t.string :name 
      t.datetime :deadline 
      t.string :why 
      t.string :how 
      t.integer :user_id
    end 
  end
end
