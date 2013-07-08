class MapsController < ApplicationController

  def world_map
    @photos = Photo.where("lat IS NOT NULL")
    respond_to do |format|
      format.html { render :world_map }
      format.json { render :json => @photos }
    end
  end

  def coords_to_photos
    lat = params[:lat]
    lng = params[:lng]
    @photos = Photo.where(:lat => lat, :lng => lng)
    render :json => @photos
  end

  def set_coord_attrs
    lat = params[:coords][0]
    lng = params[:coords][1]
    @photos = params[:photo_ids].each do |photo_id|
      Photo.find(photo_id).update_attributes(:lat => lat, :lng => lng)
    end
    render "users/mymap"
  end

end
