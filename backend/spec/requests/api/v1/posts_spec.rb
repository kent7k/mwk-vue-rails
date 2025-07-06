# spec/requests/api/v1/posts_spec.rb
require 'rails_helper'

RSpec.describe 'Api::V1::Posts', type: :request do
  let!(:user)  { create(:user) }
  let(:valid_params) do
    {
      post: {
        name: '新着投稿',
        user_id: user.id,
        quickword: 'テスト用',
        catchcopy: '詳細',
        member: 5,
        place: '東京',
        category: '遊び',
        price: 100,
        start_time: '09:00',
        finish_time: '18:00',
        release: '2025-06-22'
      }
    }
  end
  let(:invalid_params) do
    { post: { name: '', price: -1 } }
  end

  describe 'POST /api/v1/posts' do
    context 'with valid params' do
      it 'creates a post' do
        expect {
          post '/api/v1/posts', params: valid_params
        }.to change(Post, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable_entity' do
        post '/api/v1/posts', params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        body = JSON.parse(response.body)
        expect(body['errors']).to include("Name can't be blank")
      end
    end
  end
end
