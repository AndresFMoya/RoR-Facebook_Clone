class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(micropost_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Micropost deleted"
    redirect_to root_url
  end

  def index

  end

end
