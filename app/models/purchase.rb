class Purchase < ApplicationRecord
  has_many :orders
  belongs_to :User
end
