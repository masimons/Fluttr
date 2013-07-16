class AlbumsController < ApplicationController
  before_filter :redirect_logged_out_user
  before_filter :redirect_user

  def new
  end

  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums
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

  def album_photos
    @album = Album.find(params[:id])
    @photos = @album.photos
    render :json => @photos
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to user_albums_path(current_user) 
  end

  def redirect_user
    user = User.find(params[:user_id])
    unless current_user == user
      redirect_to user_path(user)
    end
  end


end
