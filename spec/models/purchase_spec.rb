require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:content) }
end
