class MessagesController < ApplicationController

  def index
  end

  def destroy
  end

  def show
  end

  def create


    message = Message.new(message_params)
    message.conversation = Conversation.find(message_params[:conversation_id])
    #message.conversation = message_params[:conversation_id]

    message.user = current_user
    message.save!
    redirect_to message.conversation, notice: t("user.successfully-created")

    #redirect_to(request.env['HTTP_REFERER'])

  end


  private
  # def set_message
  #   @message = Message.find(params[:id])
  # end

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end



end
