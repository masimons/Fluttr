class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order('created_at DESC').first(5)
    @favorites = @user.favorite_photos
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(params[:user])
    respond_to do |format|
      format.json { render :json => @user }
      format.html { redirect_to user_path(current_user)}
    end
  end

  def mymap
    # TODO: change current_user to User.find(params[:id])
    @user = User.find(params[:id])
    @albums = @user.albums #(:includes => :photos)
    @photos = @user.photos.where('lat IS NOT NULL')
    respond_to do |format|
      format.html { render :mymap }
      format.json { render :json => @photos }
    end
  end

  def feed
    if params[:page]
      @photos = Kaminari.paginate_array(current_user.feed_photos).page(params[:page])
      render :feed, :layout => false
    else
      #@followees = current_user.followees.includes(:photos).includes(:comments)
      @photos = Kaminari.paginate_array(current_user.feed_photos).page(1)
    end
  end

end
