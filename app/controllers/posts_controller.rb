# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
    else
      flash[:danger] = "Post content can't be blank"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_back(fallback_location: root_path)
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
