class CreateMaterialTruckType < ActiveRecord::Migration
  def change
    create_table :material_truck_types do |t|
    	t.integer :truck_type_id
    	t.integer :material_id
    end
  end
end
