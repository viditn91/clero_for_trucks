class Route < ActiveRecord::Base
  belongs_to :truck_owner
  belongs_to :city
  validates :city_id, presence: true
end