class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.includes(:comments).where(user_id: params[:id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      @post = Post.new(post_params)
      @post.author_id = current_user.id
      @post.likes_counter = 0
      @post.comments_counter = 0
    
      if @post.save
        redirect_to users_path
      else
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
