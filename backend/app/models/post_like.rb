class Post < ApplicationRecord
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end

class User < ApplicationRecord
  has_many :post_likes, dependent: :destroy
  has_many :liked_posts, through: :post_likes, source: :post
end

class PostLike < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # 同じユーザーが同じポストを 2 回以上 like しない
  validates :user_id, uniqueness: { scope: :post_id }
end
