class ListingInquirsController < ApplicationController
    # before_action :check_if_valid_user, only: [:create]

    def create
        # @listing = Current.user.my_property_listings.build(new_listing_params)
        # params[:id] params[:prop_id]
        @listingInq = MyPropertyListing.find_by(id: params[:prop_id], user_id: params[:id])
        
        @inquir = @listingInq.inquirs.build(inquir_params)

        if @inquir.save
            flash[:notice] = "Success: You submitted and inquiry."
            redirect_to my_listing_path(id: params[:id])
        else
            flash[:notice] = "Failed"
            redirect_to show_listing_path(id: session[:user_id], prop_id: params[:prop_id])
        end

    end

    private

    def inquir_params
        params.require(:inquir).permit(:name, :email, :number, :message)
    end

    def check_if_valid_user
        if Current.user == nil
            flash[:notice] = "You don't have access."
            redirect_to sessions_new_login_path()
        end
    end

end