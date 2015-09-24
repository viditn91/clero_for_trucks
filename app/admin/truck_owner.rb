ActiveAdmin.register TruckOwner do
  permit_params :name, :mobile, city_ids: []

  index do
    column :id
    column :name
    column :mobile
    column :cities do |truck_owner|
      truck_owner.cities.pluck :name
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table_for truck_owner do
      row :id
      row :name
      row :mobile
      row :cities do |truck_owner|
        truck_owner.cities.pluck :name
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :mobile
      f.input :cities, :as => :check_boxes
    end

    actions
  end

end
