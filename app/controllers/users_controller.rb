class UsersController < ApplicationController 
    before_action :set_user, only: [:show,:edit,:update,:destroy]
    def new
        @user = User.new
    end

    def show 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to MessageMe"
            redirect_to chatrooms_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username,:email,:telephone,:password,:password_confirmation)
    end
end