class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:message] = "User has been successfully created!"
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # def update
  #   respond_with :api, :v1, User.update(params[:id], user_params)
  # end

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
