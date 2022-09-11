class Public::PostsController < ApplicationController
  before_action :authenticate_user!



  def new
    @post=Post.new
    @tag_lists=Tag.all
  end

  def create
    #@posts=Post.all
    @post=Post.new(post_params)
    #split(nil)だと会員が全角ｽﾍﾟｰｽでﾀｸﾞを分割したとき、意図しないタグが生成され
    tag_list=params[:post][:tag_name].split(/[[:blank:]]/)
    @post.user_id=current_user.id
    if @post.save
      @post.save_posts(tag_list)
      redirect_to posts_path
    else
      flash.now[:alert]="投稿に失敗しました"
      render :new
    end
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    @tag_lists=Tag.all
    render "index"
  end

  def index
    if params[:keyword].present?
      posts=Post.publish.search(params[keywrod])
      #paramsの中身が[:search]になってるけどkeywordに統一していいのでは
    elsif params[:tag_id].present?
      @tag=Tag.find(params[:tag_id])
      posts=@tag.posts.publish.order(created_at: :desc)
    else
      posts = Post.all.publish.order(created_at: :desc)
    end
    @tag_lists=Tag.all
    @posts=Kaminari.paginate_array(posts.publish).page(params[:page]).per(10)
  end

  def show
    @post=Post.find(params[:id])
    @post_comment=PostComment.new
    @tag_lists=Tag.all
  end

  def edit
    @tag_lists=Tag.all
    @post=Post.find(params[:id])
    @post_comment=PostComment.new

  end

  def update
    # @tag=Tag.find(params[:tag_id])
    @post=Post.find(params[:id])
    @post_comment=PostComment.new
    @tag_lists=Tag.all
    @post.update(post_params)
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:post_status, :title, :body, :user_id, :genre_id, :image, post_images:[])
  end
end
