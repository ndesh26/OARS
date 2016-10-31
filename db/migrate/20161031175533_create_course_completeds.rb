class CreateCourseCompleteds < ActiveRecord::Migration[5.0]
  def change
    create_table :course_completeds do |t|
      t.string :name
      t.string :code
      t.integer :credit
      t.string :grade

      t.timestamps
    end
  end
end
