class UserController < ApplicationController
def index
    @users = User.all
  end

  def create
    User.create(user_params)
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    u = User.find(params[:id])
    u.update(user_params)
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:email, :password)
  end
end
