class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :status

      t.timestamps
    end
    add_index :requests, :user_id
    add_index :requests, :course_id
    add_index :requests, [:user_id, :course_id], unique: true
  end
end
