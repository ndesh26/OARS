class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :roll
      t.string :phone
      t.text :address
      t.string :dob

      t.timestamps
    end
  end
end
