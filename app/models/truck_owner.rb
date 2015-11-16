class TruckOwner < ActiveRecord::Base
  has_many :routes
  has_many :trucks
  has_many :cities, through: :routes

  validates :name, :mobile, :location, presence: true

  def self.import_from_csv(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      row = row.to_hash.symbolize_keys
      truck_owner_hash = row.slice :name, :mobile, :location, :id_proof, :id_number,
        :account_number, :ifsc_code, :bank_name, :bank_branch, :operator_name, :operator_mobile,
        :company_name, :address, :pan, :regions

      truck_hash = row.slice :number, :manufacturer, :wheels, :registration_date,
      :chassis_number, :engine_number, :length, :tonnage, :load_preference,
      :driver_name, :driver_contact

      truck_owner = self.find_or_initialize_by(name: truck_owner_hash[:name])
      truck_owner.assign_attributes(truck_owner_hash)
      truck_owner.save!

      truck_type = TruckType.find_or_initialize_by(name: row[:truck_type])
      truck_type.save!

      truck = Truck.find_or_initialize_by(
        truck_owner_id: truck_owner.id,
        truck_type_id: truck_type.id,
        number: truck_hash[:number]
      )
      truck.assign_attributes(truck_hash)
      truck.save!
    end
  end
end