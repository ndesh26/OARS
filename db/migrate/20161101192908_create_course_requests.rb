class CreateCourseRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :course_requests do |t|
      t.integer :user_id
      t.string :status
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
