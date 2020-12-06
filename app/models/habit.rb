class Habit < ActiveRecord::Base
    has_many :users, through: :routines 
    belongs_to :routines
end 