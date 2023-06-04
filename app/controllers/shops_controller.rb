#require 'open-uri'
#require 'JSON'

class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]
  
    def index
      @shops = Shop.all
      #scrape_instagram("kazuki_na_0312")
    end
  
    def show
      @shop = Shop.find(params[:id])
    end
  
    def new
      @shop = Shop.new
    end
  
    def create
      @shop = Shop.new(shop_params)
      if @shop.save
        redirect_to shops_path, notice: '店の情報が登録されました'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @shop.update(shop_params)
        redirect_to shops_path, notice: 'Shop was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @shop.destroy
      redirect_to shops_path, notice: 'Shop was successfully destroyed.'
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
      params.require(:shop).permit(:name, :explantory_text, :completed)
    end
  end
  