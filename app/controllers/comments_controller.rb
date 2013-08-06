class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params[:comment])
    render :json => { :comment => @comment, :user => current_user }
  end

end
