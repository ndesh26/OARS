class AddDetailsToCourseCompleted < ActiveRecord::Migration[5.0]
  def change
    add_reference :course_completeds, :user, foreign_key: true
  end
end
