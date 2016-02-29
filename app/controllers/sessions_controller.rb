class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    u = User.where(email: params[:user][:email]).first
    if u.authenticate(params[:user][:password])
      session[:user_id] = u.id.to_s
      redirect_to u
    else
      redirect_to :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :new
  end
end
