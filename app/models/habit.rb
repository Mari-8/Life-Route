class Habit < ActiveRecord::Base
    belongs_to :user 
    belongs_to :routines
end 