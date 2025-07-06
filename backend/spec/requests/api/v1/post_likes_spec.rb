# spec/requests/api/v1/post_likes_spec.rb
require 'rails_helper'

RSpec.describe 'Api::V1::Likes', type: :request do
  let(:user)  { create(:user) }
  let(:post_record) { create(:post) }

  # 例としてログインヘッダが要る場合：
  let(:headers) { user.create_new_auth_token }

  describe 'GET /api/v1/posts/:post_id/like' do
    context 'when liked' do
      before { create(:post_like, user: user, post: post_record) }

      it 'returns liked: true' do
        get api_v1_post_like_path(post_record), headers: headers
        expect(json_body['liked']).to be true
      end
    end

    context 'when not liked' do
      it 'returns liked: false' do
        get api_v1_post_like_path(post_record), headers: headers
        expect(json_body['liked']).to be false
      end
    end
  end

  describe 'POST /like' do
    it 'creates like' do
      expect {
        post api_v1_post_like_path(post_record), headers: headers
      }.to change(PostLike, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /like' do
    before { create(:post_like, user: user, post: post_record) }

    it 'destroys like' do
      expect {
        delete api_v1_post_like_path(post_record), headers: headers
      }.to change(PostLike, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
