class CreateTruckType < ActiveRecord::Migration
  def change
    create_table :truck_types do |t|
    	t.string :name
    	t.timestamps null: false
    end
  end
end
