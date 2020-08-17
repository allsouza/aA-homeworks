# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, acceptance: { message: "Password can't be blank" }
    validate :ensure_session_tokem
    attr_reader :password

    def ensure_session_tokem
        self.session_token = User.generate_session_token unless self.session_token
    end

    def self.find_by_credentials
        self.find_by(username: username, password: password)
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = nil
        self.save
    end

    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(@password)
    end

end
