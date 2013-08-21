class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_param)
    if @user.save
      flash[:notice] = "User: #{@user.username} is now registered!"
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def users_param
    params.require(:user).permit!
  end
end