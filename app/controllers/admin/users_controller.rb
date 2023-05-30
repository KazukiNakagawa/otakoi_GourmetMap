class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    private
    
    def require_admin
        unless current_user && current_user.admin?
          redirect_to root_path, alert: "管理者権限が必要です"
        end
    end
end
