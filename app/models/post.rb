class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    validates :title, {presence: true}
    validates :NumApplicants, {presence: true}
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}

    belongs_to :user
    #いいね機能のアソシエーション処理
    has_many :favorites, dependent: :destroy

    def user
        return User.find_by(id: self.user_id)
    end
end
