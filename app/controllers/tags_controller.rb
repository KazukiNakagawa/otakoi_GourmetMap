class TagsController < ApplicationController
    def create
      @tag = Tag.find_or_create_by(tag_params)
      redirect_to @tag
    end
  
    private
  
    def tag_params
      params.require(:tag).permit(:name)
    end
end
  