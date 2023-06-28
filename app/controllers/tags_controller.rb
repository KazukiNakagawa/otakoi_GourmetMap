class TagsController < ApplicationController
    def create
      @tag = Tag.find_or_create_by(tag_params)
      redirect_to @tag
    end

    def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
      redirect_to @shop
    end
  
    private
  
    def tag_params
      params.require(:tag).permit(:name)
    end
end
  