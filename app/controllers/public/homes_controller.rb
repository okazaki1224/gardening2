class Public::HomesController < ApplicationController
  def top
    @posts = Post.order('id DESC').limit(3)
    @tag_lists=Tag.all
  end

  def about
  end
end
