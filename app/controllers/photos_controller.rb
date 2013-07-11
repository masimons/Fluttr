class PhotosController < ApplicationController

  def new
  end

  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums
    render :index, :layout => "photo_grid"
  end

  def create
    urls = params[:urls]
    album_id = params[:album_id]
    @albums = current_user.albums
    
    if album_id
      go_to_photo_edit_view = false
      @album = Album.find(album_id)
    else
      go_to_photo_edit_view = true
      @album = @albums.where(:title => "Other").first
    end

    @photos = urls.map do |url|
      @album.photos.create(:image_url => url)
    end

    if go_to_photo_edit_view
      render :edit, :layout => false 
    else
      render "albums/edit", :layout => false
    end

  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments.includes(:user)
    render :show, :layout => "photo_show"
  end

  def edit
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes!(params[:photo])
    if @photo.save
      render :json => @photo
    else
      flash[:errors] ||= []
      flash[:errors] << @photo.errors.full_messages.to_sentence
      render :edit
    end
  end

  def all
    @photos = Photo.order('created_at DESC')
  end
end
