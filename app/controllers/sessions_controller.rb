class SessionsController < ApplicationController
    def new
    end

    def create 
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            flash[:notice] = "Welcome, user #{user.username}"
            redirect_to chatrooms_path
        else
            flash[:alert] = "Invalid credentials provided!"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out successfully!"
        redirect_to root_path
    end
end