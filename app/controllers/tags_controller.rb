class TagsController < ApplicationController

  def index 
  end

  def create
    name = params[:name].capitalize
    photo_id = params[:photo_id]

    @tag = Tag.find_by_name(name)

    if photo_id
      if @tag
        Tagging.create!(:tag_id => @tag.id, :photo_id => photo_id)
        render :json => @tag
      else
        @tag = Tag.create!(:name => name)
        Tagging.create!(:photo_id => photo_id, :tag_id => @tag.id)
        render :json => @tag
      end
    else
      album = Album.find(params[:album_id])
      if @tag
        album.photos.each do |photo|
          Tagging.create!(:tag_id => @tag.id, :photo_id => photo.id)
        end
        render :json => @tag
      else
        @tag = Tag.create!(:name => name)
        album.photos.each do |photo|
          Tagging.create!(:photo_id => photo.id, :tag_id => @tag.id)
        end
        render :json => @tag
      end
    end
  end
end
