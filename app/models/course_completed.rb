class CourseCompleted < ApplicationRecord
    validates :name, :presence => true
    validates :code, :presence => true
    validates :credit, :presence => true
    validates :grade, :presence => true, :length => { :minimum => 1 }

    belongs_to :user
end
