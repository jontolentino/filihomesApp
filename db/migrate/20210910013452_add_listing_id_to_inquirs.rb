class AddListingIdToInquirs < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquirs, :my_property_listing, index:true
  end
end
