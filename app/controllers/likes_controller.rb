class LikesController < ApplicationController
    before_action :authenticate_user! # ユーザーがログインしていることを確認するフィルター
  
    def create
      @shop = Shop.find(params[:id])
      current_user.likes.create(shop: @shop)
      redirect_to shop_path(@shop), notice: 'いいねしました。'
    end
  
    def destroy
      @shop = Shop.find(params[:id])
      current_user.likes.find_by(shop: @shop).destroy
      redirect_to shop_path(@shop), notice: 'いいねを解除しました。'
    end
  end
  