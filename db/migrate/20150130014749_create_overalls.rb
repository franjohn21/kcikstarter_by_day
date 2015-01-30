class CreateOveralls < ActiveRecord::Migration
  def change
    create_table :overalls do |t|
    	t.integer :total
    	t.timestamps
    end
  end
end
