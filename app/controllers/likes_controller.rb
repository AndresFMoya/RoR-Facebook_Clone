# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_like, only: [:destroy]

  def new
    @like = current_user.likes.build
  end

  def create
    @like = current_user.likes.build(like_params)
    flash[:success] = 'You like this post!' if @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like.destroy
    flash[:success] = 'You unlike this post!'
    redirect_back(fallback_location: root_path)
  end

  def find_like
    @like = current_user.likes.find_by(like_params)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
