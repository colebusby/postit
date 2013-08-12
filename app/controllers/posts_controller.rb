class PostsController < ApplicationController
  

  def create

  end

  def new
    @post = Post.new
  end

  def edit

  end

  #def show

  #end

  def index
      @posts = Post.all
  end

  def update

  end
end
