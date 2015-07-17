class Game < ActiveRecord::Base
	belongs_to :user, class_name: "User", foreign_key: "creator_id"
	has_many :enrollments
	has_many :players, through: :enrollments, source: :user
end
