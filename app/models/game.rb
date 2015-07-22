class Game < ActiveRecord::Base
	belongs_to :creator, class_name: "User"

	has_many :enrollments, dependent: :destroy
	has_many :players, :through => :enrollments


end

