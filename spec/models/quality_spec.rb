require 'rails_helper'

RSpec.describe Quality, type: :model do
  it { should have_many(:contents).dependent(:destroy) }
  it { should validate_presence_of :name }
end
