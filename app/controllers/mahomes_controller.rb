class MahomesController < ApplicationController
  def index
    render 'index'
  end
  def contact
    
    newMessage = Message.create(name:params[:name], company: params[:company], title: params[:title], email: params[:email], phone: params[:phone], message: params[:message])
    puts newMessage.errors.full_messages
    redirect_to '/message'
  end
  def message
    redirect_to ''
  end
end