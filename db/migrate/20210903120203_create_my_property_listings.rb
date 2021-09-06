class CreateMyPropertyListings < ActiveRecord::Migration[6.1]
  def change
    create_table :my_property_listings do |t|
      t.string :title
      t.string :lot_area
      t.string :floor_area
      t.string :location_name
      t.string :location_address
      t.float :latitude
      t.float :longitude
      t.string :bedroom_count
      t.string :bathroom_count
      t.text :details

      t.timestamps
    end
  end
end
