class Course < ApplicationRecord
    has_many :user_requests, class_name: "Request", foreign_key: "course_id", dependent: :destroy
    has_many :users, through: :user_requests

end
