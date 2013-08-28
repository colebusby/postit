class CommentsController < ApplicationController
  before_action :set_comment, only: [:vote]
  before_action :require_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:description))
    @comment.post = @post
    @comment.creator = current_user

    if  @comment.save
      flash[:notice] = "Your comment has been added!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    flash[:notice] = "Vote Counted!"
    redirect_to posts_path
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end