class FollowingsController < ApplicationController

  def create
    @following = Following.create(:followee_id => params[:followee_id]) #.merge(:follower_id => current_user.id)
    @following.follower_id = current_user.id
    @following.save
    render :json => @following   
  end

  def destroy_following
    @following = Following.where(:followee_id => params[:followee_id], :follower_id => current_user.id).first
    @following.destroy
    render :json => @following
  end

end
