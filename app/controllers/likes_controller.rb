class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]

    @like = Like.find_or_create_by(author_id: current_user.id, post_id: params[:post_id])

    if @like.save
      redirect_to(request.referrer || root_path)
    else
      render :new
    end
  end
end
