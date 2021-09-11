class SettingsController < ApplicationController
    before_action :check_if_valid_user, only: [:index, :update]
    
    def index
        @user = User.find(Current.user.id)
    end 

    def update
        
        @user = User.find_by(id: params[:id])
        @user.update(settings_params)
        flash[:notice] = "Settings Updated"
        redirect_to my_listing_path()

        # if Current.user.id != @my_listing.user_id
        #     flash[:notice] = "You cannot edit this listing"
        #     redirect_to show_listing_path()
        # else 
        #     @my_listing.update(new_listing_params)
        #     flash[:notice] = "Listing updated"
        #     redirect_to show_listing_path()
        # end
    end

    private

    def settings_params
        params.require(:user).permit(:name, :email, :prc_id, :user_image)
    end

    def check_if_valid_user
        if Current.user == nil
            flash[:notice] = "You don't have access."
            redirect_to sessions_new_login_path()
        end
    end
end