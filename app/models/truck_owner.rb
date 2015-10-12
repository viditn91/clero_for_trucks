class TruckOwner < ActiveRecord::Base
  has_many :routes
  has_many :cities, through: :routes

  validates :name, :mobile, :location, presence: true
end