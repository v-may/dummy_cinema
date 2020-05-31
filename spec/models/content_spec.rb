require 'rails_helper'

RSpec.describe Content, type: :model do
  it { should belong_to(:film) }
  it { should belong_to(:quality) }
  it { should validate_presence_of :price }
end
