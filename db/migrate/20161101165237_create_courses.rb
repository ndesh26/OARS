class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :dept
      t.string :code
      t.string :title
      t.string :instructor
      t.integer :credit
      t.string :timing

      t.timestamps
    end
  end
end
