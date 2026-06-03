class ChatroomsController < ApplicationController
    before_action :require_logged_in
    before_action :get_all_chatrooms
    before_action :set_chatroom, only: [:show,:edit,:update,:destroy] 
    
    def index 
    end

    def show 
        
    end

    def new 

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private 
    def get_all_chatrooms
        @chatrooms = current_user.chatrooms
    end
    def set_chatroom
        @chatroom = Chatroom.find(params[:id])
    end
end