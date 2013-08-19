class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(params.require(:post).permit!)
    if @post.save
      flash[:notice] = "You created a new post!"
      redirect_to posts_path
    else
      #handle validations
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit!)
      flash[:notice] = "Your post has been updated"
      redirect_to post_path(@post)
    else
      #handle validations
      render :edit
    end
  end
end
