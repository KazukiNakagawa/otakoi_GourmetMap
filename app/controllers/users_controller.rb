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
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "登録に成功しました。"
    else
      render :new
    end
  end

  def show
    user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to request.referer
  end

  def search
    @users = User.where(role: params[:roles])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :hobby, :profile, :avatar)
  end
end
