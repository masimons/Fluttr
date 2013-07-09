class UsersController < ApplicationController

  def show
    @photos = current_user.photos.order('created_at DESC')
    @user = User.find(params[:id])
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
    @albums = current_user.albums #(:includes => :photos)
    @photos = current_user.photos.where('lat IS NOT NULL')
    respond_to do |format|
      format.html { render :mymap }
      format.json { render :json => @photos }
    end
  end

  def feed
    @posts = current_user.followees(:includes => :photos)
  end

end
