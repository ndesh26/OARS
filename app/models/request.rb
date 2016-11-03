class Request < ApplicationRecord
    belongs_to :course, class_name: "Course"
    belongs_to :user, class_name: "User"
    validates :user_id, presence: true
    validates :course_id, presence: true
end
