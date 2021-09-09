class SessionsController < ApplicationController
    
    def new

    end

    def create
        user = User.find_by(email: params[:email])
        # finds existing user, checks to see if user can be authenticated
        if user.present? && user.authenticate(params[:password])
            # sets up user.id sessions
            session[:user_id] = user.id
            redirect_to my_listing_path(id: session[:user_id]), notice: 'Logged in successfully'
        else
            # render :new
            redirect_to sessions_new_login_path, notice: 'Invalid email or password'
        end
    end

    def destroy
        # deletes user session
        redirect_to my_listing_path(id: session[:user_id]), notice: 'Logged Out'
        session[:user_id] = nil
    end
  end