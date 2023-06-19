class CommentsController < ApplicationController
    def create
      byebug
      @shop = Shop.find(params[:shop_id])
      @comment = @shop.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to shops_path, notice: 'コメントが投稿されました。'
      else
        byebug
        redirect_to shops_path, alert: 'コメントの投稿に失敗しました。'
      end
    end 
    
    def new
      @shop = Shop.find(params[:shop_id])
      @comment = @shop.comments.build
    end
    
    def destroy
      Comment.find(params[:id]).destroy
      redirect_to shop_path(params[:shop_id])
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
