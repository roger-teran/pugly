class EnrollmentsController < ApplicationController
	
	def create
		a = game.enrollments.select{|x| x.team == 'team_a'}
		b = game.enrollments - a 
		if(a.count > b.count)
			@enrollment = Enrollment.new(user: current_user,
										game: @game, 
										team: b)
		elsif(b.count > a.count)
			@enrollment = Enrollment.new(user: current_user,
										game: @game, 
										team: a)
		# @enroll = Enrollment.new(
		# @enroll.user_id = current_user.id
		# @enroll.game_id = current_game.id
		# @enroll.team = )
		end
	end

	def show
		
	end
  # DOES THIS GO HERE?!?!?!?!?

  def teams
    self.enrollments
      .partition { |x| x.team == "team_a" }
      .map { |y| y.players }
  end

  # I DON'T FUCKING KNOW!
	private

	# def next_team (game)
	# 	if game.enrollments = a
	# 		game.enrollments = b
	# 	else 
	# 		game.enrollments = a
	# 	end
	# 	# return	a || b
	# end
end
