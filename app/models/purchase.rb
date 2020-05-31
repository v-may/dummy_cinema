class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content

  scope :active, -> { where 'created_at > ?', Time.now - self.expiration_period }

  def self.expiration_period
    2.days
  end
end
