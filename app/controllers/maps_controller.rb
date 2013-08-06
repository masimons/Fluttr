class MapsController < ApplicationController

  def world_map
    @photos = Photo.where("lat IS NOT NULL")
    respond_to do |format|
      format.html { render :world_map }
      format.json { render :json => @photos }
    end
  end

  def coords_to_photos
    @photos = Photo.where(:lat => params[:lat], :lng => params[:lng])
    render :json => @photos
  end

  def set_coord_attrs
    @user = current_user
    @albums = current_user.albums
    @recent_photos = @user.photos.order('created_at DESC').first(9)
    lat, lng = params[:photo][:lat].to_f, params[:photo][:lng].to_f
    @photos = params[:photo_ids].each do |photo_id|
      Photo.find(photo_id).update_attributes(:lat => lat, :lng => lng)
    end
    render "users/show"
  end

end
