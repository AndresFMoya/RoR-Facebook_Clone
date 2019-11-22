class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = current_user.comments.build
  end

  def create

    @comment = current_user.comments.build(comment_params)
    @comment.save
    flash[:success] = 'Comment created!'
    redirect_to '/posts'
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to root_url
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
