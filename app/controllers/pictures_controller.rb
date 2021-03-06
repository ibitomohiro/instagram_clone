class PicturesController < ApplicationController
  before_action :logged_in_user, only:[:new,:create,:destroy, :edit, :update]
  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = current_user.pictures.new(picture_params)
    else
    @picture = current_user.pictures.new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
    redirect_to pictures_path, notice:"画像を編集しました"
    else
      render 'edit'
    end
  end

  def confirm
    @picture = current_user.pictures.new(picture_params)
     if @picture.invalid?
      render 'new'
    end
  end


  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      PictureMailer.picture_mail(@picture).deliver
      flash[:success] = "Pictureを投稿しました！"
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:danger] = "投稿が削除されました！"
    redirect_to pictures_path
  end
  
  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
end
