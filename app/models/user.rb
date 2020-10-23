class User < ApplicationRecord
    has_many :reviews 
    has_many :likes
    has_many :purchases 
    has_many :orders, through: :purchase
    has_secure_password

end
