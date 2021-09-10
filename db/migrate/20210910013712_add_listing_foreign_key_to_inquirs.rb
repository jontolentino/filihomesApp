class AddListingForeignKeyToInquirs < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :inquirs, :my_property_listings
  end
end
