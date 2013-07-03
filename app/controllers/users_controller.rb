class UsersController < ApplicationController

  def show
    @photos = current_user.photos.order('created_at DESC')
  end

end
