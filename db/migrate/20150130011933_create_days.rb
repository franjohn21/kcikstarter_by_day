class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
    	t.integer :day, :month, :year, :weekday
    	t.integer :total, :default => 0
    	t.string :weekday_name, :month_name

    	t.timestamps
    end
  end
end
