class Truck < ActiveRecord::Base
  belongs_to :truck_owner
  belongs_to :truck_type
  validates :number, :truck_owner_id, :truck_type_id, presence: true
  validates :number, uniqueness: true

  def display_name
  	number
  end
end