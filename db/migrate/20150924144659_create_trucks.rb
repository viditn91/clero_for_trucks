class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :number
      t.integer :truck_owner_id
      t.integer :truck_type_id
      t.timestamps null: false
    end
  end
end
