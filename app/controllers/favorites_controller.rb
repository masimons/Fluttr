class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorite_photos
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @favorites }
    end
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
