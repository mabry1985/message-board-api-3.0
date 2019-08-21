class GroupsController < ApplicationController
  include Response

  def index
    @groups = Group.all
    json_response(@groups)
  end

  def show
    @group = Group.find(params[:id])
    json_response(@group)
  end

  def create
    @group = Group.create(group_params)
    json_response(@group)
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

  private

  def group_params
    params.permit(:author, :content)
  end
end
