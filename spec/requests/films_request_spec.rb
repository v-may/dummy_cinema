require 'rails_helper'

RSpec.describe "Films", type: :request do
  let!(:movies) { create_list :movie, 5 }
  let!(:seasons) { create_list :season_with_episodes, 3 }

  describe 'GET /films' do
    it 'returns films' do
      get '/films'

      expect(response).to have_http_status :ok
      expect(json[:data].size).to eq 8
    end

    context 'given a film type' do
      before { get '/films', params: {type: 'season'} }

      it 'returns films of requested type' do
        expect(response).to have_http_status :ok
        expect(json[:data].size).to eq 3
      end
    end

    describe 'sort order' do
      let(:first_film) { seasons.second }

      before do
        first_film.update created_at: Time.now - 1.day
        get '/films'
      end

      it 'returns list sorted by creaion' do
        expect(json[:data].first[:id].to_i).to eq first_film.id
      end
    end

    describe 'pagination' do
      before { get '/films', params: {page: 2, per_page: 3} }

      it 'returns specified amount of films' do
        expect(response).to have_http_status :ok
        expect(json[:data].size).to eq 3
        expect(json[:links][:next]).to include('/films?page=3&per_page=3')
        expect(json[:links][:prev]).to include('/films?page=1&per_page=3')
      end
    end
  end
end
