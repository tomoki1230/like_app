class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count
  # [user_id, post_id] の組の一意性
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: "は同じ投稿に2回以上いいねはできません"
  }
end
