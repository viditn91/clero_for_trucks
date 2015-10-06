class AddWeightToEntry < ActiveRecord::Migration
  def change
  	remove_column :entries, :weight_id
  	add_column :entries, :weight, :integer
  end
end