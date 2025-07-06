class Api::V1::PostLikesController < ApplicationController
  before_action :authenticate_api_v1_user!   # ← API トークン必須
  before_action :set_post

  # GET /api/v1/posts/:post_id/like
  def show
    liked = PostLike.exists?(user: current_api_v1_user, post: @post)
    render json: { liked: liked }, status: :ok
  end

  # POST /api/v1/posts/:post_id/like
  def create
    PostLike.create!(user: current_api_v1_user, post: @post)
    head :created
  end

  # DELETE /api/v1/posts/:post_id/like
  def destroy
    PostLike.find_by(user: current_api_v1_user, post: @post)&.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
