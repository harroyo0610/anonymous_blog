class UsersController < ApplicationController
  def show
    if current_user.id.to_s == params[:id]
  	  @user = User.find(params[:id])
    else
      redirect_to posts_path
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:success] = "Welcome to my app"
      log_in(@user)
  		redirect_to posts_path
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
