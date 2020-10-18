class PicturesController < ApplicationController
  before_action :logged_in_user, only:[:new,:create,:destroy]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = current_user.pictures.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
    redirect_to pictures_path, notice:"Pictureを編集しました"
    else
      render 'edit'
    end
  end


  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = "Pictureを投稿しました！"
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = "投稿が削除されました！"
    redirect_to pictures_path
  end
  
    private
    def picture_params
      params.require(:picture).permit(:content, :image)
    end
end
