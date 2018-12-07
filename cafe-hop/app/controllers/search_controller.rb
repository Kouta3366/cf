class SearchController < ApplicationController
  def search_page
  end

  def search_area1
  end

  def search_area2
    @area = Area.find_by(id: params[:id])
    @lists = List.all.order(created_at: :desc)
    @areas = Area.all
  end

  def search_ranking
    @areas = Area.all
    @lists = List.all
    @lists.each do |list|
      list.likes = Like.where(list_id: list.id).count
      list.save
    end
    @lists = List.all.order(likes: :desc, created_at: :desc)
  end
end
