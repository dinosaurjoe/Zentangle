class PersonalMessagesController < ApplicationController
  before_action :find_conversation!
  skip_after_action :verify_authorized

  def create
    @conversation ||= Conversation.create(author_id: current_user.id,
                                          receiver_id: @receiver.id)
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save

    if @conversation.personal_messages.size == 1
      redirect_to conversation_path(@conversation)
    else
      new_message = render('personal_messages/_personal_message', locals: { personal_message: @personal_message }, layout: false)

      Pusher.trigger("conversation-#{@conversation.id}-#{Rails.env}", 'message', {
        message: new_message
      })
    end
  end

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
    end
  end
end
