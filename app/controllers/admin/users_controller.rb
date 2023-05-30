class Admin::UsersController < ApplicationController
    def index
      if params[:search].present?
        @users = User.where("name LIKE ?", "%#{params[:search]}%")
      else
        @users = User.all
      end
    end
    
    private
    
    def require_admin
        unless current_user && current_user.admin?
          redirect_to root_path, alert: "管理者権限が必要です"
        end
    end
end
