class PicturesController < ApplicationController
  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = "Pictureを投稿しました！"
      redirect_to pictures
    else
      render 'new'
    end
  end

  def destroy
  end
  
    private
    def picture_params
      params_require(:picture).permit(:content, :image)
    end
end
