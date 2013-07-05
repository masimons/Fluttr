class GroupsController < ApplicationController

  def index
    @owned_groups = current_user.owned_groups
    @member_of_groups = current_user.groups
  end

  def create
    @group = current_user.owned_groups.build(params[:group])  
    if @group.save
      Membership.create(:user_id => current_user.id, :group_id => @group.id)
      redirect_to user_groups_path(current_user)
    else
      flash[:errors] ||= []
      flash[:errors] << @group.errors.full_messages.to_sentence
      render :back
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if params[:group]
      @group = Group.find(params[:id])

      @group.update_attributes(params[:group])
      redirect_to group_path(@group)
    else
      @photo = Photo.create(params[:photo])
      respond_to do |format|
        format.json { render :json => @photo }
      end
    end
  end

  def all
    @groups = Group.order('created_at DESC') # where(:public => true)
  end

  def show
    @group = Group.find(params[:id])
    @creator = User.find(@group.creator_id)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_groups_path(current_user)
  end

end
