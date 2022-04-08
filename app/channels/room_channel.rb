class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
  end

  #サーバーサイドのspeakアクションの定義（room.coffeeのspeakメソッドから値取得）
  def speak(message)
    @chatmessage = ChatMessage.create(content: message['message'], user_id: message['user'].to_i, room_id: message['room'].to_i)
    @user = User.find_by(id: message['user'].to_i)
    @time = @chatmessage.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
    ActionCable.server.broadcast 'room_channel', message: message['message'], user: @user.name, time: @time
  end
end

