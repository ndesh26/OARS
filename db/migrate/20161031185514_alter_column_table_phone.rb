class AlterColumnTablePhone < ActiveRecord::Migration[5.0]
    def self.up
        change_table :users do |t|
        t.change :phone, :string
    end
    end
  def self.down
    change_table :users do |t|
      t.change :phone, :integer
    end
  end  
end
