ActiveAdmin.register TruckOwner do
  permit_params :name, :mobile, :location, :id_proof, :id_number, :account_number, :ifsc_code, :bank_name, :bank_branch, city_ids: []

  index do
    column :id
    column :name
    column :mobile
    column :location
    column :id_proof
    column :id_number
    column :regions
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table_for truck_owner do
      row :id
      row :name
      row :mobile
      row :location
      row :id_proof
      row :id_number
      row :account_number
      row :ifsc_code
      row :bank_name
      row :bank_branch
      row :regions
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :mobile
      f.input :location
      f.input :id_proof
      f.input :id_number
      f.input :account_number
      f.input :ifsc_code
      f.input :bank_name
      f.input :bank_branch
      f.input :regions
    end

    actions
  end

end
