class Habit < ActiveRecord::Base
    has_many :users, through: :routines 
    belongs_to :routines

    validates :name, :why, :when, :where, :duration, :user_id, :routine_id, presence: true 
end 