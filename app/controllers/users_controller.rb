class UsersController < ApplicationController

  before_action :set_user, only:[:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_param)
    if @user.save
      flash[:notice] = "User: #{@user.username} is now registered!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @posts = @user.posts
  end

  private

  def users_param
    params.require(:user).permit!
  end

  def set_user
    @user = User.find_by(slug: params[:id])
  end
end