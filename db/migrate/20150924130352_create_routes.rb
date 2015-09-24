class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
    	t.integer :truck_owner_id
    	t.integer :city_id
    	t.timestamps null: false
    end
  end
end
