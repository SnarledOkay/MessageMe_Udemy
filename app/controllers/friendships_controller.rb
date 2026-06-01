class FriendshipsController < ApplicationController 
    before_action :require_logged_in
    def index
        @sent_requests = Friendship.where(sender_id: current_user.id,status:"pending")
        @received_requests = Friendship.where(receiver_id: current_user.id,status:"pending")
    end

    def update
        friendship = Friendship.find_by(receiver_id: current_user.id, sender_id: params[:sender_id])
        if friendship
            friendship.status = "accepted"
            friendship.save
            flash[:notice] = "Friend request accepted!"
            redirect_to user_path(params[:sender_id])
        else
            flash[:alert] = "Something went wrong."
            redirect_to user_path(params[:sender_id])
        end
    end

    def create 
        # "#where" returns a collection, so always true instead of nil
        exist_friendship = Friendship.find_by(receiver_id: params[:receiver_id],sender_id: current_user.id)&.destroy
        friendship = Friendship.new(sender_id: current_user.id, receiver_id: params[:receiver_id])
        if friendship.save
            flash[:notice] = "Friend request sent successfully!"
            redirect_to user_path(params[:receiver_id])
        else
            flash[:alert] = "Something went wrong."
            redirect_to user_path(params[:receiver_id])
        end
    end

    def destroy
        if params[:receiver_id]
            friendship = Friendship.find_by(receiver_id: params[:receiver_id],sender_id:current_user.id)
            friendship.destroy
            flash[:notice] = "Request cancelled successfully!"
            redirect_to user_path(params[:receiver_id])
        elsif params[:sender_id]
            friendship = Friendship.find_by(sender_id: params[:sender_id],receiver_id: current_user.id)
            friendship.destroy
            flash[:notice] = "Request rejected!"
            redirect_to user_path(params[:sender_id])
        else
            friendship = Friendship.where(sender_id: current_user.id, receiver_id: params[:friend_id]).or(Friendship.where(sender_id: params[:friend_id],receiver_id: current_user.id)).first
            friendship.destroy
            flash[:notice] = "Unfriend user successfully!"
            redirect_to users_path
        end
    end
end
