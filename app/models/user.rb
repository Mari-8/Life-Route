class User < ActiveRecord::Base
 has_secure_password


    has_many :habits, through: :routines
    has_many :goals
    has_many :routines

    validates :name, :email, presence: true
end 