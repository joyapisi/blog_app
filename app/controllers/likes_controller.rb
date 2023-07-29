class LikesController < ApplicationController
  def create
    @like = Like.find_or_create_by(author_id: current_user.id, post_id: params[:post_id])
    return unless @like.save

    redirect_to(request.referrer || root_path)
  end
end
