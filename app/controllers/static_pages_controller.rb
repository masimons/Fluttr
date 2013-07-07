class StaticPagesController < ApplicationController

  def home
    render :home, :layout => "home_page_layout"
  end

end
