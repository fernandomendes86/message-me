class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    valido = params[:valido].present?
    if valido && message.save 
      ActionCable.server.broadcast "chatroom_channel",
      mod_message: message_render(message)
    else
      @nome = 'Fernando'
      render 'update', locals: { body: message.body, message: message_params }
    end
  end

  def update

  end

  private
  
  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
  
end