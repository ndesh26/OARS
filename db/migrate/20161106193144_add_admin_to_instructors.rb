class AddAdminToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :admin, :boolean, default: false 
  end
end
