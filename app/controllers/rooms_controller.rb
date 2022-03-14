class RoomsController < ApplicationController
  def create
    @room = Room.new
    if  @room.save
      UserRoom.create(user_id: session[:user_id], room_id: @room.id)
      redirect_to("/rooms/new")
    else
      redirect_to("/")
    end
  end

  def new
    @room = Room.find_by(id: 7)
    @users =  @room.user_rooms

  end
end
