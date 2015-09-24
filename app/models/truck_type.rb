class TruckType < ActiveRecord::Base
  validates :name, presence: true
end