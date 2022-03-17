class ChatMessagesController < ApplicationController
  def create
    if ChatMessage.create(room_id: params[:room_id], user_id: session[:user_id], content: params[:content])
      redirect_to("/rooms/#{params[:room_id]}")
    else
      render("rooms/new")
    end
  end
end
