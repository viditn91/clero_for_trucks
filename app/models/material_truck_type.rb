class MaterialTruckType < ActiveRecord::Base
  belongs_to :material
  belongs_to :truck_type
  validates :truck_type_id, presence: true
end