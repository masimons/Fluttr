class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorite_photos
  end

  def create
    @favorite = Favorite.create(:photo_id => params[:photo_id], :user_id => current_user.id)
    render :json => @favorite
  end

  def destroy_favorite
    @favorite = Favorite.where(:user_id => current_user.id, :photo_id => params[:photo_id]).first
    @favorite.destroy
    render :json => @favorite
  end

end
