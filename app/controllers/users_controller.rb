class UsersController < ApplicationController 
    before_action :set_user, only: [:show,:edit,:update,:destroy]
    before_action :require_logged_in, only: [:index,:show,:edit,:update,:destroy]
    before_action :require_same_user, only: [:edit,:update,:destroy] 

    def index
        @friends = Friendship.where(sender_id: current_user.id, status: "accepted")
            .or(Friendship.where(receiver_id: current_user.id, status: "accepted"))
    end

    def new
        @user = User.new
    end

    def show 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to MessageMe!"
            redirect_to chatrooms_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Information updated successfully!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        flash[:alert] = "Goodbye, user #{@user.username}"
        flash[:alert] = "Account deleted successfully!"
        @user.destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username,:email,:telephone,:introduction,:password,:password_confirmation)
    end
    def require_same_user
        if current_user != @user
            flash[:alert] = "Unauthorized to execute this action!"
            redirect_to root_path
        end
    end
end