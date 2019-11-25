# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    flash[:success] = 'You like this post!' if @like.save
    redirect_to root_url
  end

  def destroy
    @like.destroy
    flash[:success] = 'You unlike this post!'
    redirect_to root_url
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
