class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{@favorite.picture.user.name}さんのお気に入り登録をしました"
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{@favorite.picture.user.name}さんのお気に入りを解除しました"
  end
end
