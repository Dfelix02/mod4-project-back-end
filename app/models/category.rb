class Category < ApplicationRecord
    has_many :game_genre, dependent: :delete_all
    has_many :items, through: :game_genre
end
