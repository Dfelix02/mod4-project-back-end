class Review < ApplicationRecord
  belongs_to :Item
  belongs_to :User
end
