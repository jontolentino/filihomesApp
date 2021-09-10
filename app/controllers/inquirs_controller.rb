class InquirsController < ApplicationController
    before_action :restrictions, only: [:index] 

    def index
        # set user
        @user = User.find(params[:id])
        @inquirs = @user.inquirs
    end

    def restrictions
        if Current.user == nil
            flash[:notice] = "You don't have access."
            redirect_to root_path()
        elsif
            Current.user.id.to_s != params[:id].to_s
            flash[:notice] = "You don't have access."
            redirect_to my_listing_path(id: session[:user_id])
        end
    end

end