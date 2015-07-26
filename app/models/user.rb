	class User < ActiveRecord::Base
	has_secure_password

	has_many :enrollments
	has_many :played_games, :through => :enrollments, :source => :game
	
	has_many :games, foreign_key: "creator_id"

	validates :username, presence: true
	validates :email, presence: true

	validates :password_digest,  length: { minimum: 6 }, presence: true, on: :create
	validates :password_digest, length: { minimum: 6 }, on: :update, allow_blank: true

	has_attached_file :avatar, styles: { 
		small: "100x100", 
		med: "200x200", 
		large: "500x500" 
	}, url: "s3_domain_url",
		path: "users/:id/avatar/:style__:basename.:extension"
	
	validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end













