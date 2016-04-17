class UsersController < ApplicationController
  skip_before_action :authenticate_user

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created.  Signing in and returning to directory."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Failed to make account."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def destroy
  end
end
