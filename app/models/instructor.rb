class Instructor < ApplicationRecord
    validates :name, :presence => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email,:presence =>true, :uniqueness => true
 
    validates :password, :presence => true, :length => { :in => 6..20 }
    has_secure_password
    validate :unique_name

    def unique_name
        self.errors.add(:email, 'is already taken') if User.where(email: self.email).exists?
    end
 end
