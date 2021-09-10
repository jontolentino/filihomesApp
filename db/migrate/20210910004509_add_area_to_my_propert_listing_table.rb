class AddAreaToMyPropertListingTable < ActiveRecord::Migration[6.1]
  def change
    add_column :my_property_listings, :area, :string
    add_column :my_property_listings, :price, :string
  end
end
