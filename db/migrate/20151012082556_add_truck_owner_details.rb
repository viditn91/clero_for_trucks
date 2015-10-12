class AddTruckOwnerDetails < ActiveRecord::Migration
  def change
  	add_column :truck_owners, :location, :string
  	add_column :truck_owners, :id_proof, :string
  	add_column :truck_owners, :id_number, :string
  	add_column :truck_owners, :account_number, :string
  	add_column :truck_owners, :ifsc_code, :string
  	add_column :truck_owners, :bank_name, :string
  	add_column :truck_owners, :bank_branch, :string
  	add_column :entries, :ticket_price, :decimal
  end
end