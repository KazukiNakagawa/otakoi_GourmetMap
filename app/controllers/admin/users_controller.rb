class Admin::UsersController < ApplicationController
    before_action :require_admin
    
    def index
      @users = User.where(admin: false)
      if params[:search].present?
        @users = User.where("name LIKE ?", "%#{params[:search]}%")
      else
        @users = User.all
      end
    end
    
    private
    
    def require_admin
        unless current_user&.admin?
          flash[:alert] = "管理ユーザーのみアクセスできます"
          redirect_to root_path
        end
    end
end
