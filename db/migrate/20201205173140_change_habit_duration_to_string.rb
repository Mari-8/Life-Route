class ChangeHabitDurationToString < ActiveRecord::Migration
  def change
    change_column :habits, :duration, :string 
  end
end
