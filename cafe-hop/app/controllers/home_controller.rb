class HomeController < ApplicationController
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}

  def ensure_correct_user
    @list = List.find_by(id: params[:id])
    if @list.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/home/top")
    end
  end

  def top
    @lists = List.all.order(created_at: :desc)
    @areas = Area.all
  end

  def show
    @list = List.find_by(id: params[:id])
    @areas = Area.all
    @user = @list.user
    @likes_count = Like.where(list_id: @list.id).count
  end

  def edit
    @list = List.find_by(id: params[:id])
    @areas = Area.all
  end

  def update
    @list = List.find_by(id: params[:id])
    @list.name = params[:name]
    @area = Area.find_by(prefecture: params[:pref])
    @list.area_id = @area.id
    @areas = Area.all
    if params[:image]
      @list.image_name = "#{@list.id}.jpg"
      image = params[:image]
      File.binwrite("public/cafe_images/#{@list.image_name}", image.read)
    end
    if @list.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/home/#{@list.id}/show")
    else
      render("home/edit")
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    if @list.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/home/top")
    end
  end
end
