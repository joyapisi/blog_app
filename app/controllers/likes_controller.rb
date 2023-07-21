class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]

#     existing_like = Like.find_by(author_id: @like.author_id, post_id: @like.post_id)
# if existing_like
# else
    @like = Like.find_or_create_by(author_id: current_user.id, post_id: params[:post_id])
    if @like.save
      redirect_to(request.referrer || root_path)
    else
      render :new
    end
    end
  end
end
