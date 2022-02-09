class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    validates :title, {presence: true}
    validates :NumApplicants, {presence: true}
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end
end
