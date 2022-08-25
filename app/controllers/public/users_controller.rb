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
  end

  def update
  end
end
