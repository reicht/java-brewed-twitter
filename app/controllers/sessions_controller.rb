class SessionsController < ApplicationController
  skip_before_action :authenticate_user


  def sign_in
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have signed in."
      redirect_to root_path
    else
      flash.now[:alert] = "No records match that Username and Password combination."
      render :sign_in
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out"
    redirect_to root_path
  end

  def sign_out
  end
end
