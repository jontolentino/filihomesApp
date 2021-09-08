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
        @listing = Current.user.my_property_listings.build(new_listing_params)

        if @listing.save
            flash[:notice] = "Success: Created a new listing"
            redirect_to my_listing_path(id: session[:user_id])
        else
            flash[:notice] = "Failed"
            redirect_to new_listing_path(id: session[:user_id])
        end
    end

    def delete_listing
    end

    private

    def new_listing_params
        params.require(:my_listing).permit(:title, :location_name, :lot_area, :floor_area, :bedroom_count, :bathroom_count, :details, :property_image)
    end

end