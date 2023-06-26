class CommentsController < ApplicationController
    def create
      @shop = Shop.find(params[:shop_id])
      @comment = @shop.comments.build(comment_params)
      @comment.user = current_user
      @comment.rate = params[:comment][:rate]

      if @comment.save
        flash[:notice] = 'コメントが投稿されました。'
        redirect_to @shop
      else
        flash[:alert] = @comment.errors.full_messages.join(', ')
        redirect_to @shop
      end
    end 
    
    def new
      @shop = Shop.find(params[:shop_id])
      @comment = @shop.comments.build
    end
    
    def destroy
      Comment.find(params[:id]).destroy
      flash[:notice] = 'コメントが削除されました。'
      redirect_to shop_path(params[:shop_id])
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
