class CreateEntries < ActiveRecord::Migration

  def change
    create_table :entries, id: :uuid do |t|
      t.string :email
      t.string :mobile
      t.string :location
      t.string :brand
      t.string :type_of
    end
  end

end