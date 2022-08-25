class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post=Post.new
  end

  def create
    #@posts=Post.all
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    
  end

  def show
    @post=Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :genre_id, :image, post_images:[])
  end
end
