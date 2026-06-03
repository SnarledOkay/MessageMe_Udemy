class Chatroom < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :messages
    enum :chatroom_type, {chat:"chat", groupchat:"groupchat"}
end