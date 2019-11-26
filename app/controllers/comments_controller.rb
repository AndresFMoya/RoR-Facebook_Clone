# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    flash[:success] = 'Comment created!' if @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: root_path)
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
