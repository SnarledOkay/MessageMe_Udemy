class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length:{minimum:3, maximum:40}
    VALID_EMAIL_REGEX ||= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
        uniqueness: {case_sensitive: false},
        length: {maximum: 100},
        format:{with: VALID_EMAIL_REGEX }
    VALID_PHONE_REGEX ||= /\A(\+84|0)\d{9}\z/
    validates :telephone, presence: true,
        uniqueness: true,
        length: {is: 10},
        format:{with: VALID_PHONE_REGEX } 
    has_secure_password
    validates :password, length:{minimum:6}, allow_nil: true
    validates :password_confirmation, presence: true, if: -> {new_record? || !password.nil?}

    has_many :friendships, foreign_key: :sender_id 
    has_many :received_friendships, class_name: "Friendship", foreign_key: :receiver_id
    has_many :sent_request, through: :friendships, source: :receiver
    has_many :received_request, through: :friendships, source: :sender

    has_many :memberships
    has_many :chatrooms, through: :memberships
    has_many :messages

    def sent_request_to?(other_user)
        friendships.exists?(receiver_id: other_user.id)
    end
    def receive_request_from?(other_user)
        friendships.exists?(sender_id: other_user.id)
    end
    def is_friend_with?(other_user)
        friendships.exists?(receiver_id: other_user.id,status:"accepted") ||
        received_friendships.exists?(sender_id: other_user.id,status:"accepted")
    end
end