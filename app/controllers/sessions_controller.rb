class SessionsController < ApplicationController
  def new
  end

  def create
  	if @user = User.find_by(email: user_params[:email]) 
      user = @user.authenticate(user_params[:password])
  		login!(user)
  		redirect_to games_path
  	else
  		flash[:message] = "Username or Password Error"
      redirect_to root_path
  	end
  end

  def destroy
  	logout!
  	redirect_to root_path
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password)
  end

end
