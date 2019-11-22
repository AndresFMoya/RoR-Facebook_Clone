class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    return unless @comment.save

    flash[:success] = "Comment created!"
    redirect_to root_url
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
