# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConversationsChannel < ApplicationCable::Channel # dont know if ConversationsChannel should be singular or plural
  def subscribed
    stream_from "conversations_channel_#{params[:conversation]}"
    #stream_from "conversation_channel"
    # http://www.thegreatcodeadventure.com/rails-5-action-cable-with-multiple-chatroom-subscriptions/

    # This worked
    # http://stackoverflow.com/questions/36926816/actioncable-how-to-use-dynamic-channels
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    MessageBroadcastJob.perform_later data
    # ActionCable.server.broadcast "conversations_channel_#{data["conversation"]}", message: data['message']
    # Message.create! content: data["message"], conversation_id: data["conversation"], user_id: data["user"]
  end
end
