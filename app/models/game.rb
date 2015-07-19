class Game < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	has_many :enrollments
	has_many :players, through: :enrollments, source: :user
	# has_many :teams, through: :enrollments
	# has_many :teams, through: :something, [delegate: :the_thing_that_needs_it, to: :the_thing_that_has_it] 
end

