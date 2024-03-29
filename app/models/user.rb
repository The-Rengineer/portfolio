class User < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  has_many :posts, dependent: :destroy
  has_many :favorites
  
  # いいね非同期で追加
  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end
 

  def posts 
    return Post.where(user_id: self.id)
  end
end
