class GroupsController < ApplicationController

def index
  @owned_groups = current_user.owned_groups
  @member_of_groups = current_user.groups
end

def all
  @groups = Group.all # where(:public => true)
end

end
