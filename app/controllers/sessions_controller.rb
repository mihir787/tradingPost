class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) && !session[:user_id]
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}"
      redirect_to user_path(user)
    else
      flash[:danger] = "invalid login"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end

end
