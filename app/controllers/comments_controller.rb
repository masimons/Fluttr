class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params[:comment])
    respond_to do |format|
      format.json {render :json => { :comment => @comment, :user => current_user }}
    end
  end

end
