class Message < ApplicationRecord
    belongs_to :chatroom
    belongs_to :user, optional: true
    enum :message_type, {user:"user",system:"system"}
end