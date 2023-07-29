module Api
  class ApiController < ApplicationController
      def create
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user = @user
  
        if @comment.save
          render json: @comment, status: :created
        else
          render json: { error: 'Error creating comment.' }, status: :unprocessable_entity
        end
      end
  
      private
  
      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
 
  # def index
  #   @users = 
  # end

  # def show
  # end
# end