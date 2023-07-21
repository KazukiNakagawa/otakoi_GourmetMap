class HashtagsController < ApplicationController
  def show
    @tag = params[:tag]
    @shops = Shop.joins(:tags).where(tags: { name: @tag })
  end
end
  