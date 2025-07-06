require 'rails_helper'

RSpec.describe 'Api::V1::Relationships', type: :request do
  let!(:follower) { create(:user) }
  let!(:followed) { create(:user) }

  describe 'POST /api/v1/relationships' do
    it 'follows a user' do
      expect {
        post '/api/v1/relationships', params: { follow_id: followed.id, user_id: follower.id }
      }.to change(Relationship, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/v1/relationships' do
    before { create(:relationship, user: follower, follow_id: followed.id) }

    it 'unfollows a user' do
      expect {
        delete '/api/v1/relationships', params: { follow_id: followed.id, user_id: follower.id }
      }.to change(Relationship, :count).by(-1)
      expect(response).to have_http_status(:created)
    end
  end
end
