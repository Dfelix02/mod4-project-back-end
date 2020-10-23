class Order < ApplicationRecord
  belongs_to :Item
  belongs_to :Purchase
end
