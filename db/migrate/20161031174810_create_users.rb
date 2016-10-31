class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :roll
      t.integer :phone
      t.text :adderess
      t.string :dob

      t.timestamps
    end
  end
end
