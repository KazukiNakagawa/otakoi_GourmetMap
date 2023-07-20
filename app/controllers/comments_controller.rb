class CommentsController < ApplicationController
    def create
      @shop = Shop.find(params[:shop_id])
      @comment = @shop.comments.build(comment_params)
      @comment.user = current_user
      @comment.rate = params[:comment][:rate]

      if @comment.save
        flash[:notice] = 'コメントが投稿されました。'
        redirect_to reviews_shop_path(@shop)
      else
        flash[:alert] = @comment.errors.full_messages.map { |msg| msg.gsub(/Content|Rate/, '') }.join(', ')
        redirect_to reviews_shop_path(@shop)
      end
    end 
    
    def new
      @shop = Shop.find(params[:shop_id])
      @comment = @shop.comments.build
    end

    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to shop_path(@comment.shop), notice: 'コメントが更新されました。'
      else
        render :edit
      end
    end
    
    def destroy
      Comment.find(params[:id]).destroy
      flash[:notice] = 'コメントが削除されました。'
      redirect_to shop_path(params[:shop_id])
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :rate)
    end
end
