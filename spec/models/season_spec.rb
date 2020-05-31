require 'rails_helper'

RSpec.describe Season, type: :model do
  it { should have_many(:episodes).dependent(:destroy) }
  it { should have_many(:contents).dependent(:destroy) }
end
