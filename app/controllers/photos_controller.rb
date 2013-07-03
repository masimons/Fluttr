class PhotosController < ApplicationController

  def new
  end

  def index
    
  end

  def create
    urls = params[:urls]
    @photos = []

    urls.each do |url|
      photo = Photo.new(:image_url => url)
      album = current_user.albums.where(:title => "Other").first
      # where(user_name: user_name, password: password).first
      photo.album_id = album.id
      photo.save!
      @photos << photo
    end
    @albums = current_user.albums
    # render json: @photos.to_json
    render :edit, :layout => false
  end

  def show
    @photo = Photo.find([:id])
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
end
