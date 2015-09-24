ActiveAdmin.register Material do
  permit_params :name, truck_type_ids: []

  index do
    column :id
    column :name
    column :truck_types do |material|
      material.truck_types.pluck :name
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table_for material do
      row :id
      row :name
      row :truck_types do |material|
        material.truck_types.pluck :name
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :truck_types, :as => :check_boxes
    end

    actions
  end

end