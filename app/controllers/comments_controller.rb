class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params[:comment])
    render :json => @comment
  end

end
