class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(params.require(:user).permit(:email, :password, :password_confirmation))
  	redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def become_provider
    @user = current_user
    @user.update(is_provider: true)
    redirect_to @user
  end

  def update
    user = User.find(params[:id])
    user.update(params.require(:user).permit(venues_attributes: [:id, :address, :lat, :lng, :_destroy]))
    redirect_to users_path
  end
end
