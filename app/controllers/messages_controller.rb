class MessagesController < ApplicationController

  def index
    @messages = Message.where(:recipient_id => current_user.id) if current_user
  end

  def show
    @message = Message.where(:id => params[:id]).last if params[:id]
  end

  def new
    if current_user
      @message = Message.new
      @message.recipient_id = params[:id]
    end
  end

  def create
    @message = Message.new
    @message.recipient_id = params[:recipient_id]
    @message.author_id = current_user.id
    @message.subject = params[:subject]
    @message.body = params[:body]

    if @message.save
      Mailer.deliver_message(@message.recipient).deliver
      redirect_to root_path
    end
  end

  def sent
    @messages = Message.where(:author_id => current_user.id) if current_user
  end
end
