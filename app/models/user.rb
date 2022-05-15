class User < ApplicationRecord
  has_many :user_rooms
  has_many :chat_messages
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  has_many :posts
  #いいね機能のアソシエーション処理
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  def posts 
    return Post.where(user_id: self.id)
  end
end
