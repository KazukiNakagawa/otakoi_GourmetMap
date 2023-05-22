class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]
  
    def index
      @shops = Shop.all
    end
  
    def show
    end
  
    def new
      @shop = Shop.new
    end
  
    def create
      @shop = Shop.new(task_params)
      if @shop.save
        redirect_to shopss_path, notice: 'Task was successfully created.'
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

    def scrape
      @task = Task.find(params[:id])
      @task.scrape_website(params[:url])
      redirect_to @task, notice: 'Website scraped successfully.'
    end      
  
    private
  
    def set_shop
      @shop = Shop.find(params[:id])
    end
  
    def shop_params
      params.require(:shop).permit(:title, :description, :completed)
    end
  end
  