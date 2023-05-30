class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_users_path
      else
        redirect_to user_path(user.id)
      end
    else
      flash.now[:alert] = "Email or Password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "you have successfully logout"
  end

end
