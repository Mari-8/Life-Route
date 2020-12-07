class Routine < ActiveRecord::Base 
    has_many :habits 
    belongs_to :users

    validates :name, :why, :duration, :user_id, presence: true 
end 