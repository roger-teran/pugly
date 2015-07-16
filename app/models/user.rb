class User < ActiveRecord::Base
	has_secure_password

	validates :username, presence: true
	validates :email, presence: true

	validates :password, length: { minimum: 10}
	validates :password_digest, presence: true
end
