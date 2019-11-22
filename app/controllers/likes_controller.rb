class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build
    return unless @like.save
    redirect_to root_url
  end

  def destroy
    @like.destroy
    redirect_to root_url
  end
end
