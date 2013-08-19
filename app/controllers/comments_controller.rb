class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:description))
    @comment.post = @post
    
    if  @comment.save
      flash[:notice] = "Your comment has been added!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end