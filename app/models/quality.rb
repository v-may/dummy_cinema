class Quality < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates_presence_of :name
end
