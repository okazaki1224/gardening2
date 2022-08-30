class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts=Post.all
  end

  def edit
  end

  def update
    @post=Post.find(params[:id])
    @post.update(post_comment_params)
    redirect_to admin_post_path(@post.id)
  end

  def destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :is_deleted)
  end
end
