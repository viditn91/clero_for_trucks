class AddCordinatesToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :longitude, :string, default: '77.2001368'
    add_column :trucks, :latitude, :string, default: '28.5494489'
  end
end