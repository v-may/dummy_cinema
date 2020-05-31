require 'rails_helper'

RSpec.describe Film, type: :model do
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:title) }
end
