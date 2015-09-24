class CreateTruckOwners < ActiveRecord::Migration
  def change
    create_table :truck_owners do |t|
    	t.string :name
    	t.string :mobile
    	t.timestamps null: false
    end
  end
end