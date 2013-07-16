class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_logged_out_user
    if !user_signed_in?
      redirect_to root_path
    end
  end

end
