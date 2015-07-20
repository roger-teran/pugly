class User < ActiveRecord::Base
	has_secure_password

	has_many :enrollments
	has_many :played_games, through: :enrollments,  source: :game
	
	has_many :games, foreign_key: "creator_id"

	validates :username, presence: true
	validates :email, presence: true

	validates :password, length: { minimum: 6 }
	validates :password_digest, presence: true
end
