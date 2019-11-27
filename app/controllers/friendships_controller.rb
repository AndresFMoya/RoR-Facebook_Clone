# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_friendship

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:success] = "Friend request sent!"
    else
      flash[:danger] = "Error sending request"
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    Friendship.find(friendship_params)
  end

  def update
    if @friendship.update(friendship_params)
      flash[:success] = 'Friend Accepted!'
    else
      flash[:danger] = "Error accepting friend"
    end
    redirect_back(fallback_location: root_path)
  end

  def find_friendship
    @friendship = Friendship.find_by(friendship_params)
  end
  # def destroy
  #   @post.destroy
  #   flash[:success] = 'Post deleted'
  #   redirect_back(fallback_location: root_path)
  # end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end


end
