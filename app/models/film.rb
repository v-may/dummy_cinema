class Film < ApplicationRecord
  validates_presence_of :type, :title
end
