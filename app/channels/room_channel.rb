class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
  end

  #サーバーサイドのspeakアクションの定義（room.coffeeのspeakメソッドから値取得）
  def speak(message)
    ActionCable.server.broadcast 'room_channel', message: message['message']
  end
end

