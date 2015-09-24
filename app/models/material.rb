class Material < ActiveRecord::Base
  has_many :material_truck_types
  has_many :truck_types, through: :material_truck_types
  validates :name, presence: true
end