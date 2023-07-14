class Admin::ShopsController < ApplicationController
    before_action :require_admin
    
    def index
      @shops = Shop.where(admin: false)
      if params[:search].present?
        @shops = Shop.where("name LIKE ?", "%#{params[:search]}%")
      else
        @shops = Shop.all
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
  