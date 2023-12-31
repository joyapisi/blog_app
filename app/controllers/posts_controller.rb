class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[index show]
  # , only: [:new, :create, :destroy]
  def index
    @posts = Post.includes(:comments).where(user_id: params[:id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
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

  def destroy
    authorize! :destroy, @post

    @post = Post.find(params[:id])
    # if current_user == @post.author
    @post = Post.find(params[:id])

    @post.likes.destroy_all
    @post.comments.destroy_all

    @post.destroy

    redirect_to root_path, notice: 'Your post was successfully deleted.'
    # else
    # end
  end

  def like
    @post = Post.find(params[:id])
    Like.create(author_id: current_user.id, post_id: @post.id)
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
