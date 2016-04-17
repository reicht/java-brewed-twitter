class BloopsController < ApplicationController
  def index
    @bloops = Bloop.all
  end

  def show
    @bloop = get_bloop
  end

  def new
    @bloop = Bloop.new
    @user = User.find(params.fetch(:user_id))
  end

  def create
    @bloop = Bloop.new(bloop_params)
    @user = User.find(params.fetch(:user_id))

    if @student.save
      redirect_to bloop_path(@bloop)
    else
      render :new
    end
  end

  def destroy
    @bloop = get_boop
    user = @bloop.user

    if @bloop.destroy
      redirect_to user_path(user)
    else
      redirect_to :back
    end
  end

  private
  def get_bloop
    Bloop.find(params.fetch(:id))
  end

  def bloop_params
    params.require(:bloop).permit(:message, :user_id)
  end
end
