class BloopsController < ApplicationController
  skip_before_action :authenticate_user, only: [ :index, :show ]

  def index
    @bloops = Bloop.all
  end

  def show
    @bloop = get_bloop
    @user = @bloop.user
  end

  def new
    @bloop = Bloop.new
  end

  def create
    @bloop = current_user.bloops.build(message: params[:bloop_message])

    if @bloop.save
      redirect_to bloop_path(@bloop)
    else
      render :new
    end
  end

  def destroy
    @bloop = get_bloop

    if @bloop.destroy
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private
  def get_bloop
    Bloop.find(params.fetch(:id))
  end

  def bloop_params
    params.require(:bloop).permit(:message)
  end
end
