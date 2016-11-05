class Course < ApplicationRecord
    has_many :user_requests, class_name: "Request", foreign_key: "course_id", dependent: :destroy
    has_many :users, through: :user_requests

    def accepted?(user)
        return user_requests.find_by(user_id: user.id).status == "Accepted"
    end
end
