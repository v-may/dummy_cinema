require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:purchases).dependent(:destroy) }
  it { should validate_presence_of :email }
  # TODO: validate email format
end
