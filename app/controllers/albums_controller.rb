class AlbumsController < ApplicationController

  def new
  end

  def index
    @albums = current_user.albums
  end

  def create
    @album = current_user.albums.create(params[:album])
    respond_to do |format|
      format.json { render :json => @album }
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
    @albums = current_user.albums
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album])
    respond_to do |format|
      format.json { render :json => @album }
    end
  end

end
