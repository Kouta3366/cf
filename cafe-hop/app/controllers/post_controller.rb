class PostController < ApplicationController
  before_action :authenticate_user

  def post_page
    @list = List.new
    @areas = Area.all
  end

  def create
    @area = Area.find_by(prefecture: params[:pref])
    @list = List.new(name: params[:name], area_id: @area.id, likes: 0, user_id: @current_user.id)
    @areas = Area.all

    if params[:image]
      @list.save
      @list.image_name = "#{@list.id}.jpg"
      image = params[:image]
      File.binwrite("public/cafe_images/#{@list.image_name}", image.read)
    else
      @list.image_name = "default.jpg"
    end

    if @list.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/home/top")
    else
      render("post/post_page")
    end
  end
end
