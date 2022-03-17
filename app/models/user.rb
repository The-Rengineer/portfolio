class User < ApplicationRecord
  has_many :user_rooms
  has_many :chat_messages
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  def posts 
    return Post.where(user_id: self.id)
  end
end
