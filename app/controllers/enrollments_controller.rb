class EnrollmentsController < ApplicationController
	# POST /games/:id/enrollments
	def create
		@game = Game.includes(:players).find(params[:game_id])

		if @game.players.include? current_user
			flash[:message] = "You've already signed up for this game!"
			redirect_to @game
		else
			@enrollment = @game.enrollments
							   .new(player: current_user, team: next_team(@game))

			if @enrollment.save
				redirect_to @game
			else
				flash[:message] = "There was an error signing up for this game..."
				redirect_to @game
			end
		end
	end

	def show
		
	end


	private
	def next_team(game)
		enrollments_a = game.enrollments.where(team: "team_a")
		enrollments_b = game.enrollments.where(team: "team_b")

		return enrollments_a.count <= enrollments_b.count ? "team_a" : "team_b"
	end
end
