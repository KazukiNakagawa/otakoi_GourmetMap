#require 'open-uri'
#require 'JSON'

class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]
  
    def index
      @shops = Shop.all
      #scrape_instagram("kazuki_na_0312")
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
      if @shop.update(shop_params)
        redirect_to shops_path, notice: '店の情報が更新されました。'
      else
        render :edit
      end
    end
  
    def destroy
      @shop = Shop.find(params[:id])
      @shop.destroy
      redirect_to shops_path, notice: '店の情報が削除されました。'
    end

    #def scrape_instagram(user_id)
      #puts "test"
      #begin
        #byebug
        #instagram_source = open("https://www.instagram.com/#{user_id}").read
        #content = JSON.parse(instagram_source.split("window._sharedData = ")[1].split(";</script>")[0])
        #return content['entry_data']['ProfilePage'][0]['user']
      #rescue Exception => e
        #return nil
      #end
    #end  
  
    private
  
    def set_shop
      @shop = Shop.find(params[:id])
    end
  
    def shop_params
      params.require(:shop).permit(:name, :explantory_text, :completed, :image, tag_names: [])
    end
  end
  