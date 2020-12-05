class User < ActiveRecord::Base
 has_secure_password


    has_many :habits
    has_many :goals
    has_many :routines
end 