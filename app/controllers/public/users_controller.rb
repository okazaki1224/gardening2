class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @posts=@user.posts
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  def unsubscribe
    @user=User.find(params[:id])
  end

  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private#
  def user_params
      params.require(:user) .permit(:email, :encrypted_password, :last_name, :first_name,
      :nickname, :introduction, :profile_image, :is_deleted)
  end


end
