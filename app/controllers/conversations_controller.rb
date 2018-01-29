class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def new
    @users = User.all
    @conversation = Conversation.new
    @conversation.messages.build

  end

  def create
    users_array = conversation_params[:user_ids]
    conversation_id = conversation_exists(users_array << current_user.id.to_s)

    if conversation_id == nil
      @conversation = Conversation.new(conversation_params)
      @conversation.users << current_user
    else
      @conversation = Conversation.find(conversation_id)
      @conversation.messages << Message.new( user_id: current_user.id, content: conversation_params[:messages_attributes]['0'][:content])
    end

    if @conversation.save
      redirect_to @conversation
    else
      puts "I dont know"
    end

  end

  def index
    @conversations = Conversation.all
  end

  def destroy
    if @conversation.destroy
      redirect_to conversations_path, notice: t("post.successfully-destroyed") #TODO need translations
    else
      redirect_to conversations(@conversation), notice: "#{t("post.not-successfully-destrpyed")} #{t("sys_admin")}" #TODO need translations
    end
  end

  def edit
  end

  def show
  end

  def update
  end


  private
  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:id, user_ids:[],  messages_attributes:[:content, :user_id])
  end

  def conversation_exists(users_array)
    conversation_id = nil
    current_user.conversations.each do | conversation  |
      users_in_conversation = []
      conversation.conversationalists.each do | conversationalist |
        users_in_conversation << conversationalist.user_id
      end
      if users_in_conversation.sort == users_array.map!(&:to_i).sort
        return  conversation.id
      end
    end
    return conversation_id
  end

end
