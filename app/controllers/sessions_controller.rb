class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if  user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Username or Password did not match.'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end
end