class Api::V1::UsersController < ApplicationController
  respond_to :json

  def create
    respond_with :api, :v1, User.create(user_params)
  end

  def show
    respond_with User.find(params[:id])
  end

  def update
    respond_with :api, :v1, User.update(params[:id], user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :picture
                                 )
  end
end
