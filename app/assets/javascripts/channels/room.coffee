#最新盤ですよ
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # 通信が確立された時の処理

  disconnected: ->
    # 通信が切断された時の処理

  received: (data) ->
    # データが送信されてきた時の処理
    # alert data["message"]
    $('#form2').append("<p>" + "内容：" + data["message"] + "</p>");
    $('#form2').append("<p>" + "名前：" + data["user"] + "</p>");
    $('#form2').append("<p>" + "時刻：" + data["time"] + "</p>");

  speak: (message, user, room) ->
    # channelのspeakアクションにmessageパラメータを渡す
    @perform 'speak', {message: message, user: user, room: room}

$(document).on 'click', '[data-behavior~=room_speaker_click]', (event) ->
  event.target.value = document.getElementById("content").value
  #channel speakへ、event.target.valueを引数に
  App.room.speak event.target.value, $('[data-user]').attr('data-user'),$('[data-room]').attr('data-room') 
  event.target.value = '保存'
