class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # post.liked_users で post を「いいね!」しているユーザーの一覧を取得できるようになる
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true
  # post を user が「いいね！」しているときは「true」，「いいね」していないときは「false」
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
