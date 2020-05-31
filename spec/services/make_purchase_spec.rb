require 'rails_helper'

RSpec.describe MakePurchase do
  let(:user) { create :user }
  let(:content) { create :content }

  it 'creates a purchase' do
    res = described_class.call user.id, content.id

    expect(res).to be_success
    expect(user.purchases).to be_one
    expect(user.purchases.first).to eq res.data
  end

  context 'when the content is already bought' do
    let!(:previous_purchase) { user.purchases.create content: content }

    it 'does not allow a new purchase' do
      res = described_class.call user.id, content.id

      expect(res).not_to be_success
      expect(res.errors).to eq ['Content already bought']
      expect(res.data).to be_nil
      expect(user.purchases).to be_one
    end

    context 'when the previous purchase is expired' do
      let!(:previous_purchase) { user.purchases.create content: content, created_at: Time.now - 49.hours }

      it 'creates a purchase' do
        res = described_class.call user.id, content.id

        expect(res).to be_success
        expect(user.purchases.count).to eq 2
      end
    end
  end

  context 'given a wrong content_id' do
    it 'returns an error' do
      res = described_class.call user.id, content.id + 1

      expect(res).not_to be_success
      expect(res.errors).not_to be_empty
    end
  end

  context 'given a wrong user_id' do
    specify do
      res = described_class.call user.id + 1, content.id

      expect(res).not_to be_success
      expect(res.errors).not_to be_empty
    end
  end
end