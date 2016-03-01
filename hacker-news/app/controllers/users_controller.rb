class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :register
    end
  end

  def get_login
    @user = User.new
  end

  def login
    user = User.find_by(username: params[:user][:username])
    if user&& user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to '/get_login'
    end
  end

  def signout
    session.clear
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
