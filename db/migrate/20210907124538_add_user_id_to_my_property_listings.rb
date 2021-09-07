class AddUserIdToMyPropertyListings < ActiveRecord::Migration[6.1]
  def change
    add_reference :my_property_listings, :user, index:true
  end
end
