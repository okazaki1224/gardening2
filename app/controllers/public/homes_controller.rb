class Public::HomesController < ApplicationController
  def top
    @posts = Post.order('id DESC').limit(3)
  end

  def about
  end
end
