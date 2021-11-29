class MessagesController < ApplicationController
  def create
  @chatroom = Chatroom.find(params[:chatroom_id])
  @message = Message.new(message_params)
  @message.chatroom = @chatroom
  @message.user = current_user
  authorize @message
  if @message.save!
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message , new: 'true'})
    )
    redirect_to activity_chatroom_path(@chatroom.activity, @chatroom, anchor: "message-#{@message.id}")
    # render plain:""
  else
    render "chatrooms/show"
  end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
