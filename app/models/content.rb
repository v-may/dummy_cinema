class Content < ApplicationRecord
  belongs_to :film
  belongs_to :quality

  validates_presence_of :price
end
