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

  describe 'GET /purchases' do
    let!(:purchases) { create_list :purchase, 5, user: user }
    let(:attributes) { {user_id: user.id, content_id: content.id} }
    subject { get '/purchases', params: attributes }

    it "returns user's purchases" do
      subject

      expect(response).to have_http_status :ok
      expect(json[:data].size).to eq 5
    end

    context 'given expired purchases' do
      before { purchases.third.update created_at: Time.now - 1.year }

      it 'returns only unexpired purchases' do
        subject

        expect(response).to have_http_status :ok
        expect(json[:data].size).to eq 4
      end
    end

    describe 'sort order' do
      let(:first_film) { purchases.second }

      before do
        first_film.update created_at: Time.now - 1.day
        subject
      end

      it 'returns list sorted by the remaining time to watch' do
        expect(json[:data].first[:id].to_i).to eq first_film.id
      end
    end
  end
end
