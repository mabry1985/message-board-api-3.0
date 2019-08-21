class V1::MessagesController < ApplicationController
    include Response
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages.all
    json_response(@messages)
  end

  def show
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.create!(message_params)
    json_response(@message)
  end

  def update
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    @group.messages.update(message_params)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.permit(:author, :content)
  end

end
