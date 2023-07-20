class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:id])
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
