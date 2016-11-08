class Instructor < ApplicationRecord
    validates :name, :presence => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email,:presence =>true, :uniqueness => true
    has_one :course     
    validates :password, :presence => true, :length => { :in => 6..20 }
    has_secure_password
 end
