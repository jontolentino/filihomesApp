class AddUsersForeignKeyToMyPropertyListings < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :my_property_listings, :users
  end
end
