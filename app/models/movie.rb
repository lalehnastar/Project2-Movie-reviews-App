class Movie < ApplicationRecord
    has_many :comments, dependent: :destroy
   
     validates :name, presence: true, length: {minimum: 5}
     validates :url, presence: true
     validates :description, presence: true
     
     validates :url, uniqueness: true
     
    
end
