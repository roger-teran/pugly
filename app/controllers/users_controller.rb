class UsersController < ApplicationController
	before_action :fetch_user , only: [ :index, :show, :edit, :update, :destroy]

	def show
		# @user = User.includes(:played_games).find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			login!(@user)
			redirect_to games_path
		else
			flash[:message] = @user.errors.full_messages.to_sentence
			redirect_to new_user_path
		end
	end


	private 
	def fetch_user
		@user = User.find(params[:id])	
	end


	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :zipcode)
	end

end
