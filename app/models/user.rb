class User < ApplicationRecord
    validates :name, :presence => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email,:presence =>true, :uniqueness => true
    validates :roll, :presence => true
    validates :phone, :presence => true, :length => { :is => 10 }
    validates :dob, :presence => true
    validates :address, :presence => true
    validates :password, :presence => true, :length => { :in => 6..20 }
    has_many :course_completeds
    has_secure_password
    has_many :course_requests, class_name: "Request", foreign_key: "user_id", dependent: :destroy
    has_many :courses, through: :course_requests
    validate :unique_name

    def unique_name
        self.errors.add(:email, 'is already taken') if Instructor.where(email: self.email).exists?
    end
 
    def request(course)
        course_requests.create(course_id: course.id, status: "Waiting")
    end

    def delete_request(course)
        course_requests.find_by(course_id: course.id).destroy
    end

    def requested?(course)
        courses.include?(course)
    end

    def accepted?(course)
        return course_requests.find_by(course_id: course.id).status == "Accepted"
    end
end
