class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    #check if the password is unique
    validates :email, uniqueness: true
end
