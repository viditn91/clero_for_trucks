class AddDetailsToTruckOwner < ActiveRecord::Migration
  def change
  	add_column :truck_owners, :operator_name, :string
  	add_column :truck_owners, :operator_mobile, :string
  	add_column :truck_owners, :company_name, :string
  	add_column :truck_owners, :address, :string
  	add_column :truck_owners, :pan, :string
  	add_column :truck_owners, :regions, :string

  	add_column :trucks, :manufacturer, :string
  	add_column :trucks, :wheels, :integer
  	add_column :trucks, :registration_date, :date
  	add_column :trucks, :chassis_number, :string
  	add_column :trucks, :engine_number, :string
  	add_column :trucks, :length, :string
  	add_column :trucks, :tonnage, :string
  	add_column :trucks, :load_preference, :string
  	add_column :trucks, :driver_name, :string
  	add_column :trucks, :driver_contact, :string
  end
end