# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    return unless @post.save

    flash[:success] = 'Post created!'
    redirect_to root_url
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to root_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
