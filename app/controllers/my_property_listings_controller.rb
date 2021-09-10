class MyPropertyListingsController < ApplicationController
    before_action :check_if_valid_user, only: [:new_listing, :create_listing, :delete_listing, :edit_listing, :patch_listing]

    def my_listing
        @my_listings = MyPropertyListing.where(user_id: params[:id]).reverse_order
        @user = User.find_by(id: params[:id])
    end

    def show_listing
        @listing = MyPropertyListing.where(user_id: params[:id], id: params[:prop_id])
        @inquir = Inquir.new()
    end

    def new_listing
        # @my_listing = MyPropertyListing.new()

        if params[:id].to_s == session[:user_id].to_s
            @my_listing = MyPropertyListing.new()
        else
            flash[:notice] = "You cannot create a listing here"
            redirect_to my_listing_path()
        end

    end

    def create_listing

        if Current.user.id
            @listing = Current.user.my_property_listings.build(new_listing_params)

            if @listing.save
                flash[:notice] = "Success: Created a new listing"
                redirect_to my_listing_path(id: session[:user_id])
            else
                flash[:notice] = "Failed"
                redirect_to new_listing_path(id: session[:user_id])
            end
        end

       
    end

    def delete_listing


        @property = MyPropertyListing.find_by(user_id: params[:id], id: params[:prop_id])

        if @property.destroy
            flash[:notice] = "You deleted a listing."
            redirect_to my_listing_path(id: params[:id])
        else
            render show_listing
            flash[:notice] = "Could not be deleted."
        end
    end

    def edit_listing
        # if Current.user.id == params[:id]
        #     @my_listing = MyPropertyListing.find_by(user_id: params[:id], id: params[:prop_id])
        # else
        #     flash[:notice] = "You cannot edit this listing"
        #     redirect_to my_listing_path(id: session[:user_id])
        # end
        @my_listing = MyPropertyListing.find_by(user_id: params[:id], id: params[:prop_id])

        if Current.user.id != @my_listing.user_id
            flash[:notice] = "You cannot edit this listing"
            redirect_to show_listing_path()
        end
    end

    def patch_listing
        @my_listing = MyPropertyListing.find_by(user_id: params[:id], id: params[:prop_id])
        
        if Current.user.id != @my_listing.user_id
            flash[:notice] = "You cannot edit this listing"
            redirect_to show_listing_path()
        else 
            @my_listing.update(new_listing_params)
            flash[:notice] = "Listing updated"
            redirect_to show_listing_path()
        end
    end

    private

    def new_listing_params
        params.require(:my_listing).permit(:title, :location_name, :lot_area, :floor_area, :bedroom_count, :bathroom_count, :details, :property_image, :area, :price)
    end

    def check_if_valid_user
        if Current.user == nil
            flash[:notice] = "You don't have access."
            redirect_to sessions_new_login_path()
        end
    end

end