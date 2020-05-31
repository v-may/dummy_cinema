require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let(:user) { create :user }
  let(:content) { create :content }

  describe 'POST /purchases' do
    let(:attributes) { {user_id: user.id, content_id: content.id} }
    subject { post '/purchases', params: attributes }

    it 'creates a purchase' do
      subject

      expect(response).to have_http_status(:ok)
      expect(user.purchases).to be_one
    end

    context 'given a wrong data' do
      before { allow(MakePurchase).to receive(:call).and_raise(ActiveRecord::RecordNotFound) }

      it 'renders the error message' do
        subject

        expect(response).to have_http_status(:not_found)
        expect(json[:error]).to eq 'ActiveRecord::RecordNotFound'
      end
    end
  end
end
