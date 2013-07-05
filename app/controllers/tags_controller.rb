class TagsController < ApplicationController

  def index 
  end

  def create
    name = params[:name].capitalize
    photo_id = params[:photo_id]

    @tag = Tag.where(:name => name).first_or_create

    if photo_id
      Tagging.create!(:tag_id => @tag.id, :photo_id => photo_id)
      
      render :json => @tag
    else
      album = Album.find(params[:album_id])
      album.photos.each do |photo|
        Tagging.create!(:tag_id => @tag.id, :photo_id => photo.id)
      end

      render :json => @tag
    end
  end

end
