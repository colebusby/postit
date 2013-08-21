class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
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
  end

  def show
    @comment = Comment.new
  end

  def update    
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated"
      redirect_to post_path(@post)
    else
      #handle validations
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
