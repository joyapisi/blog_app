module Api
    class CommentsController < ApiController
      def index
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
      end
  
      def create
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user = @user
  
        if @comment.save
          render json: @comment, status: :created
        else
          render json: { error: 'An error occured while creating your comment!' }, status: :unprocessable_entity
        end
      end
  
      private
  
      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end