class TagsController < ApplicationController

  def index
    
  end

  def create
    name = params[:name].capitalize
    photo_id = params[:photo_id]

    @tag = Tag.find_by_name(name)
    if @tag
      Tagging.create!(:tag_id => @tag.id, :photo_id => photo_id)
      render :json => @tag
    else
      @tag = Tag.create!(:name => name)
      Tagging.create!(:photo_id => photo_id, :tag_id => @tag.id)
      render :json => @tag
    end
  end
end
