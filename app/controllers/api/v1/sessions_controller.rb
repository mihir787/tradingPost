class Api::V1::SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password]) && !session[:user_id]
      session[:user_id] = user.id
      respond_with :api, :v1, current_user
    else
      respond_with :api, :v1, user
    end
  end

  def destroy
    session.clear
    respond_with :api, :v1, current_user
  end

end
