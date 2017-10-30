class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:sessions][:email])
  	if user && user.authenticate(params[:sessions][:password])
  		log_in(user)
      params[:sessions][:remember_me] == "1" ?  remember(user) : forget(user)
  		redirect_to user
  	else
  		flash[:danger] = "Invalid email or password"
  		render 'new'	
  	end
  	
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
