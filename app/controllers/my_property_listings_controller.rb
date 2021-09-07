class MyPropertyListingsController < ApplicationController
    
    def my_listing
        @my_listings = MyPropertyListing.all.reverse_order()
        @user = User.find_by(id: params[:id])
    end

    def show_listing
        @listing = MyPropertyListing.find_by(id: params[:prop_id])
    end

    def new_listing
        @my_listing = MyPropertyListing.new()
    end

    def create_listing
        @listing = MyPropertyListing.new(new_listing_params)

        if @listing.save
            flash[:notice] = "Success: Created a new listing"
            redirect_to my_listing_path(id: 1)
        else
            render new_listing
        end
    end

    def delete_listing
    end

    private

    def new_listing_params
        params.require(:my_listing).permit(:title, :location_name, :lot_area, :floor_area, :bedroom_count, :bathroom_count, :details, :property_image)
    end

end