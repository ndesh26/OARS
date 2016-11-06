class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :dept
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
