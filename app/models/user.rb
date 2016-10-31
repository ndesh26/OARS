class User < ApplicationRecord
    validates :name, :presence => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :roll, :presence => true
    validates :phone, :presence => true, :length => { :equal => 10 }
    validates :dob, :presence => true
    validates :address, :presence => true

    has_many :course_completed
end
