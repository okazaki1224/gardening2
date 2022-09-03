class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post=Post.new
    @tag_lists=Tag.all
  end

  def create
    #@posts=Post.all
    @post=Post.new(post_params)
    tag_list=params[:post][:tag_name].split(nil)
    @post.user_id=current_user.id
    if @post.save
      @post.save_posts(tag_list)
      redirect_to posts_path
    else
      flash.now[:alert]="投稿に失敗しました"
      render :new
    end
  end

  def index
    if params[:search].present?
      posts=Post.posts_search(params[search])
    elsif params[:tag_id].present?
      @tag=Tag.find(params[:tag_id])
      posts=@tag.posts.order(created_at: :desc)
    else
      posts = Post.all.order(created_at: :desc)
    end
    @tag_lists=Tag.all
    @posts=Kaminari.paginate_array(posts).page(params[:page]).per(10)
  end

  def show
    @post=Post.find(params[:id])
    @post_comment=PostComment.new
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :genre_id, :image, post_images:[])
  end
end
