class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  def index
    @posts = Post.all
  end


  def create
    @post = Post.create(post_params)

    if @post.invalid?
      flash[:error] = "<strong>Could not save </strong> the data you entered is invalid"
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Article was successfully updated"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def show
    @comment = Comment.new
  end



  def destroy
    @post.destroy
    flash[:notice] = "Post was deleted successfully"
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
