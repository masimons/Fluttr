class GroupsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @owned_groups = @user.owned_groups
    @member_of_groups = @user.groups
    render :index, :layout => false
  end

  def create
    @group = current_user.owned_groups.build(params[:group])  
    if @group.save
      Membership.create(:user_id => current_user.id, :group_id => @group.id)
      redirect_to group_path(@group)
    else
      flash[:errors] ||= []
      flash[:errors] << @group.errors.full_messages.to_sentence
      redirect_to :back
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
    if params['search_word']
      @groups = Group.search(name: params['search_word'])
      render :all, :layout => false
    else
      @groups = Group.order('created_at DESC') # where(:public => true)
    end
  end

  def show
    @group = Group.find(params[:id])
    @creator = User.find(@group.creator_id)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_path(current_user)
  end

end
