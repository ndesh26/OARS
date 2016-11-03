class Course < ApplicationRecord
    has_many :user_requests, class_name: "Request", foreign_key: "course_id", dependent: :destroy

end
