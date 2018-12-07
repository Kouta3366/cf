class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(
      user_id: @current_user.id,
      list_id: params[:list_id]
    )
    @like.save
    if params[:id2].to_i == 1
      redirect_to("/home/top")
    end
    if params[:id2].to_i == 2
      redirect_to("/home/#{params[:list_id]}/show")
    end
    if params[:id2].to_i == 3
      redirect_to("/users/#{params[:id3]}")
    end
    if params[:id2].to_i == 4
      redirect_to("/users/#{params[:id3]}/likes")
    end
    if params[:id2].to_i == 5
      redirect_to("/search/#{params[:id3]}")
    end
    if params[:id2].to_i == 6
      redirect_to("/search/search_ranking")
    end
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      list_id: params[:list_id]
    )
    @like.destroy
    if params[:id2].to_i == 1
      redirect_to("/home/top")
    end
    if params[:id2].to_i == 2
      redirect_to("/home/#{params[:list_id]}/show")
    end
    if params[:id2].to_i == 3
      redirect_to("/users/#{params[:id3]}")
    end
    if params[:id2].to_i == 4
      redirect_to("/users/#{params[:id3]}/likes")
    end
    if params[:id2].to_i == 5
      redirect_to("/search/#{params[:id3]}")
    end
    if params[:id2].to_i == 6
      redirect_to("/search/search_ranking")
    end
  end
end
