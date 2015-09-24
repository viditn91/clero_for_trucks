class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.integer :from_city_id
    	t.integer :to_city_id
    	t.integer :material_id
    	t.integer :truck_type_id
    	t.integer :weight_id
        t.integer :truck_id
    	t.datetime :date
    	t.integer :number_of_trucks
        t.datetime :allocated_at
        t.string :mobile

        t.timestamps null: false
    end
  end
end