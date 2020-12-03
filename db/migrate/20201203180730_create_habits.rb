class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name 
      t.string :why
      t.string :when 
      t.string :where
      t.integer :duration 
      t.integer :user_id 
      t.integer :routine_id 
    end 

  end
end
