class Membership < ApplicationRecord
    belongs_to :chatroom
    belongs_to :user
    enum :role, {member:"member",admin:"admin"}

    def unread_message_count 
        if last_read_at.nil?
            chatroom.messages.count
        else 
            chatroom.messages.where("created_at > ?",last_read_at).count
        end
    end
end