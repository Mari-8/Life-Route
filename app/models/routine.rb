class Routine < ActiveRecord::Base 
    has_many :habits 
    belongs_to :users

end 