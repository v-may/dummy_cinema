require 'rails_helper'

RSpec.describe Episode, type: :model do
  it { should validate_presence_of(:number) }
  it { should validate_uniqueness_of(:number).scoped_to(:parent_id) }
end
