ActiveAdmin.register Entry do
  permit_params :mobile, :from_city_id, :to_city_id, :weight_id, :material_id, :truck_type_id,
                :date, :number_of_trucks, :truck_id, :ticket_price, :note

  index do
    column :from_city
    column :to_city
    column :mobile
    column :weight
    column :material
    column :truck_type
    column :date
    column :"number of trucks" do |entry|
      entry.number_of_trucks
    end
    column :note
    column :created_at
    column :updated_at
    column :allocated_at
    column :truck
    column :ticket_price
    column :actions do |entry|
      if entry.allocated_at.nil?
        link_to 'Allocate', edit_admin_entry_path(entry)
      end  
    end
  end

  show do
    attributes_table_for entry do
      row :from_city
      row :to_city
      row :mobile
      row :weight
      row :material
      row :truck_type
      row :date
      row :number_of_trucks
      row :note
      row :ticket_price
      row :created_at
      row :updated_at
      row :allocated_at
      row :truck
    end
  end

  form do |f|
    if f.object.new_record?
      f.inputs "Details" do
        f.input :from_city
        f.input :to_city
        f.input :mobile
        f.input :weight
        f.input :material
        f.input :truck_type
        f.input :date, :as => :datepicker
        f.input :number_of_trucks
      end
      actions
    else
      truck_owner_ids = Route.where(city_id: [f.object.from_city_id, f.object.to_city_id]).pluck(:truck_owner_id)
      
      f.inputs "Eligible Truck Owners" do
        if truck_owner_ids.present?
          TruckOwner.where(id: truck_owner_ids).each do |owner|
            ul do
              li { "#{ owner.name } : #{ owner.mobile }" }
            end
          end
        else
          li { "No Truck Owner operates on the selected route" }
        end
      end

      f.inputs "Add a Note" do
        f.input :note
      end

      if truck_owner_ids.present?
        f.inputs "Allocate Truck" do
          f.input :truck, :as => :select, :collection => Truck.where(truck_owner_id: truck_owner_ids).map{|t| [t.number, t.id]}
          f.input :ticket_price
        end
      end
      actions
    end
  end
end