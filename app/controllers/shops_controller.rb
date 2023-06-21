class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]
  
    def index
      if params[:tag]
        @tag = Tag.find_by(name: params[:tag])
        if @tag
          @shops = @tag.shops
        else
          @shops = []
        end
      else
        @shops = Shop.all
      end
    end
  
    def show
      @shop = Shop.includes(:tags).find(params[:id])
      @tags = @shop.tags
    end
  
    def new
      @shop = Shop.new
    end
  
    def create
      @shop = Shop.new(shop_params)
      @shop.image.attach(params[:shop][:image]) if params[:shop][:image]
      tag_names = params[:shop][:tag_names].split(",")

      if @shop.save
        redirect_to shops_path, notice: '店の情報が登録されました'
      else
        render :new
      end
    end
  
    def edit
      @shop = Shop.find(params[:id])
      @tags = @shop.tags
    end
  
    def update
      @shop = Shop.find(params[:id])
      logger.debug '++++++'
      logger.debug params
      logger.debug '++++++'
      if @shop.update(shop_params)
        redirect_to @shop, notice: '店の情報が更新されました。'
      else
        render :edit
      end
    end
  
    def destroy
      @shop = Shop.find(params[:id])
      @shop.destroy
      redirect_to shops_path, notice: '店の情報が削除されました。'
    end

    def reviews
      @shop = Shop.find(params[:id])
      @comments = @shop.comments
      @reviews = @shop.reviews
      @comment = Comment.new
    end

    def rate
      @review = Review.find(params[:id])
      @review.update(rating: params[:rating].to_i)
      redirect_to @review.shop
    end

    def bookmark
      @shop = Shop.find(params[:id])
        current_user.bookmarks.create(shop: @shop)
        redirect_to @shop
    end
  
    private
  
    def set_shop
      @shop = Shop.find(params[:id])
    end
  
    def shop_params
      params.require(:shop).permit(:name, :explantory_text, :completed, :image, :url, :address, :tag_names, tags_attributes: [:id, :name])
    end
  end
  