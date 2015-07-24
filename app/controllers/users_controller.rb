class UsersController < ApplicationController
	before_action :fetch_user , only: [ :index, :show, :edit, :update, :destroy]

	def show
		# @user = User.includes(:played_games).find(params[:id])
		@users = User.includes(:games, :played_games).find(params[:id])
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

	# def update
 #    respond_to do |format|
 #      if @user.update(user_params)
 #        format.html { redirect_to @user, notice: 'User was successfully updated.' }
 #        format.json { render :show, status: :ok, location: @user }
 #      else
 #        format.html { render :edit }
 #        format.json { render json: @user.errors, status: :unprocessable_entity }
 #      end
 #    end
 #  end

	# GET /user/new
  def new
    @user = User.new
  end

	private 
	def fetch_user
		@user = User.find(params[:id])	
	end


	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :zipcode, :avatar)
	end

end




# <% @users.games.where("date LIKE '%-07-%'").order('date').each do |game| %>













