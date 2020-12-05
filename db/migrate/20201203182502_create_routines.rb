class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t| 
      t.string :name 
      t.string :why 
      t.string :duration
    end
  end
end
