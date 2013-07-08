class StaticPagesController < ApplicationController
  before_filter :redirect_logged_in_user

  def home
    render :home, :layout => "home_page_layout"
  end

  def redirect_logged_in_user
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

end
