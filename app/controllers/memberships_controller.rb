class MembershipsController < ApplicationController

  def create
    @membership = Membership.create(params[:membership])
    render :json => @membership
  end

  def destroy_membership
    @membership = Membership.where(:user_id => current_user.id, :group_id => params[:group_id]).first
    @membership.destroy
    render :json => @membership
  end

end
