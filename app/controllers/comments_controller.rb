class CommentsController < ApplicationController
  before_action :set_comments, only: [:create, :destroy]

  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy

    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "The message was deleted"
    redirect_to root_path

  end

  private

  def set_comments
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
