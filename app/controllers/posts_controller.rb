class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, only: [:new, :create, :edit, :update, :vote]
  before_action :require_creator, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
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

  def vote
    vote_action(@post)
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_creator
    access_denied if @post.creator != current_user
  end
end