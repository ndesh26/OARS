class Course < ApplicationRecord
    has_many :user_requests, class_name: "Request", foreign_key: "course_id", dependent: :destroy
    has_many :users, through: :user_requests
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    #validates :email,:presence =>true, :uniqueness => true
    def accepted?(user)
        return user_requests.find_by(user_id: user.id).status == "Accepted"
    end
end
