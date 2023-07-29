module Api
    class PostsController < ApiController
      def index
        @user = User.find(params[:user_id])
        @posts = @user.posts 
        render json: @posts
      end
    end
  end