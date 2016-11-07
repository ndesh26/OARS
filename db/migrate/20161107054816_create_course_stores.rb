class CreateCourseStores < ActiveRecord::Migration[5.0]
  def change
    create_table :course_stores do |t|
      t.string :title
      t.string :code
      t.string :dept
      t.integer :credit
      t.string :grade
      t.string :sem
      t.integer :user_id

      t.timestamps
    end
  end
end
