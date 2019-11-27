class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:success] = "Friend request sent!"
    else
      flash[:danger] = "Error sending request"
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    if @friendship.update
      flash[:success] = 'Friend Accepted!'
    else
      flash[:danger] = "Error accepting friend"
    end
    redirect_back(fallback_location: root_path)
  end

  # def destroy
  #   @post.destroy
  #   flash[:success] = 'Post deleted'
  #   redirect_back(fallback_location: root_path)
  # end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmation)
  end
end
