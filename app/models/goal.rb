class Goal < ActiveRecord::Base 
     belongs_to :user 

     validates :name, :deadline, :why, :how, :user_id, presence: true
end 
