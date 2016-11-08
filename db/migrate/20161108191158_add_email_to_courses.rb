class AddEmailToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :email, :string
  end
end
