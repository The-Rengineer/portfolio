class RoomsController < ApplicationController
  def create
    current_user = User.find_by(id: session[:user_id]) 

    # どのユーザーとチャットするかを取得。
    @user = User.find(params[:user_id])

    # カレントユーザーのuser_roomにあるroom_idの値の配列をroomsに代入。
    rooms = current_user.user_rooms.pluck(:room_id)

    # user_roomモデルから
    # user_idがチャット相手のidが一致するものと、
    # room_idが上記roomsのどれかに一致するレコードを
    # user_roomsに代入。
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    # もしuser_roomが空でないなら
    unless user_rooms.nil?
      # @roomに上記user_roomのroomを代入
      @room = user_rooms.room
    else
      # それ以外は新しくroomを作り、
      @room = Room.new
      @room.save
      # user_roomをカレントユーザー分とチャット相手分を作る
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    
    redirect_to("/rooms/#{@room.id}")
  end

  def new
    @room = Room.find_by(id: params[:room_id])
    @chats = @room.chat_messages
  end

  def top
    @user = User.find_by(id: session[:user_id])
    @rooms = @user.user_rooms
  end
end
