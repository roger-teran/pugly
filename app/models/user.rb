class User < ActiveRecord::Base
	has_secure_password

	has_many :enrollments
	has_many :played_games, :through => :enrollments, :source => :game
	
	has_many :games, foreign_key: "creator_id"

	validates :username, presence: true
	validates :email, presence: true

	validates :password, length: { minimum: 6 }
	validates :password_digest, presence: true

	has_attached_file :avatar, styles: { 
		small: "64x64", 
		med: "200x200", 
		large: "400x400" 
	}

	validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
