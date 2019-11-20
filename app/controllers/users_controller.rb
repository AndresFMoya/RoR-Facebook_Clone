class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # def create
  #   @user = User.find(params[:id])
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render 'registrations#new'
  #   end
  # end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
