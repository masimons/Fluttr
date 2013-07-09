class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order('created_at DESC')
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
    # grab friends' photos in desc order
    @followees = current_user.followees.includes(:photos).order('created_at DESC').includes(:comments) #.includes(:user)
    @photos = current_user.recent_friends_photos
  end

end
