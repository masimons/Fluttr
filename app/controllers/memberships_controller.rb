class MembershipsController < ApplicationController

  def create
    @membership = Membership.create(params[:membership])
    render :json => @membership
  end

end
