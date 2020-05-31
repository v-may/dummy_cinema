class Film < ApplicationRecord
  validates_presence_of :type, :title

  scope :listed, -> { where parent_id: nil }
end
