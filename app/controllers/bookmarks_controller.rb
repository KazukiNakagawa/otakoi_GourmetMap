class BookmarksController < ApplicationController
    def index
        @bookmarked_shops = current_user.bookmarks.includes(:shop).map(&:shop)
    
        if params[:search].present?
          @bookmarked_shops = Shop.where(id: @bookmarked_shops.map(&:id)).where("name LIKE ?", "%#{params[:search]}%")
        end
    end
end