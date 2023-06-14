class CommentsController < ApplicationController
    def create
        @shop = Shop.find(params[:shop_id])
        @comment = @shop.comments.build(comment_params)
        if @comment.save
          redirect_to shop_reviews_path(@shop), notice: 'コメントが投稿されました。'
        else
          redirect_to shop_reviews_path(@shop), alert: 'コメントの投稿に失敗しました。'
        end
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
