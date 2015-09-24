ActiveAdmin.register Truck do
  permit_params :number, :truck_owner_id, :truck_type_id


  index do
    column :id
    column :number
    column :truck_owner
    column :truck_type
    column :created_at
    column :updated_at
    actions
  end

end