class Item < ApplicationRecord
  has_many :items 
  has_many:reviews 
  has_many:likes 
  has_many:orders
  has_many :game_genre, dependent: :delete_all
  has_many :categories, through: :game_genre
  
end
