ActiveAdmin.register Truck do
  permit_params :number, :truck_owner_id, :truck_type_id


  index do
    column :id
    column :number
    column :truck_owner
    column :truck_type
    column :"location" do |truck|
      link_to 'Click Here', locate_admin_truck_path(truck)
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :number
      f.input :truck_owner
      f.input :truck_type
    end

    actions
  end

  member_action :locate do
  end

end