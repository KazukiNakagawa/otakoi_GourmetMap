class UsersController < ApplicationController
  before_action :already_login?, only: [:new, :create]
  before_action :login?, only: :show
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path, notice: "you have successfully sign in"
    else
      render :new
    end
  end

  def show
    user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :hobby, :profile)
  end
end
