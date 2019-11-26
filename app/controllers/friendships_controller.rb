class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  # def create
  #   @friendship = 
  #   if @friendship.save
  #     flash[:success] = 'Friend request sent!'
  #   else
  #     flash[:danger] = "Error sending request"
  #   end
  #   redirect_back(fallback_location: root_path)
  # end

  # def update
  #   @post = current_user.posts.build(post_params)
  #   if @post.save
  #     flash[:success] = 'Post created!'
  #   else
  #     flash[:danger] = "Post content can't be blank"
  #   end
  #   redirect_back(fallback_location: root_path)
  # end

  # def destroy
  #   @post.destroy
  #   flash[:success] = 'Post deleted'
  #   redirect_back(fallback_location: root_path)
  end
end
