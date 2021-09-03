class MyPropertyListingsController < ApplicationController
    
    def my_listing
        @my_listings = MyPropertyListing.all.reverse_order
    end

    def create_listing
    end

    def delete_listing
    end

end