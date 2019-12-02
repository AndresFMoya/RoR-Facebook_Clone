# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_friendship, only: [:update]

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:success] = 'Friend request sent!'
    else
      flash[:danger] = 'Error sending request'
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    Friendship.find(friendship_params)
  end

  def update
    if @friendship.update(confirmed:true)
    @confirmed_friendship = Friendship.new(user_id: @friendship.friend_id,
                                             friend_id: @friendship.user_id, confirmed: 'true')
     @confirmed_friendship.save
      flash[:success] = 'Friend request accepted!'
    else
      flash[:warning] = 'Error accepting request!'
    end
    redirect_back(fallback_location: root_path)
  end

  def find_friendship
    @friendship = Friendship.find_by(friendship_params_update)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed, :id)
  end

  def friendship_params_update
    params.require(:friendship).permit(:id)
  end
end
