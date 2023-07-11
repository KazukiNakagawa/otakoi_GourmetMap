class LikesController < ApplicationController
    #before_action :authenticate_user!, only: [:create]
  
    def create
      @shop = Shop.find(params[:id])
      current_user.likes.create(shop: @shop)
      redirect_back fallback_location: root_path, notice: 'いいねしました。'
    end
  
    def destroy
      @shop = Shop.find(params[:id])
      current_user.likes.find_by(shop: @shop).destroy
      redirect_back fallback_location: root_path, notice: 'いいねを解除しました。'
    end
  end
  