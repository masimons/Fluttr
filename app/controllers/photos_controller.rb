class PhotosController < ApplicationController

  def new
  end

  def index
  end

  def create
    urls = params[:urls]

    @albums = current_user.albums
    album = @albums.where(:title => "Other").first

    @photos = urls.map do |url|
      album.photos.create(:image_url => url)
    end
  
    render :edit, :layout => false
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments.includes(:user)
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
