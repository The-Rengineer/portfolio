#最新盤ですよ
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # 通信が確立された時の処理

  disconnected: ->
    # 通信が切断された時の処理

  received: (data) ->
    # データが送信されてきた時の処理
    # alert data["message"] 
    divAscync = document.createElement("div");
    $(divAscync).addClass('changeStyle');
    $(divAscync).append("<p>" + "内容：" + data["message"] + "</p>");
    $(divAscync).append("<p>" + "名前：" + data["user"] + "</p>");
    $(divAscync).append("<p>" + "時刻：" + data["time"] + "</p>");
    $('#chat-message').append(divAscync);

  speak: (message, user, room) ->
    # channelのspeakアクションにmessageパラメータを渡す
    @perform 'speak', {message: message, user: user, room: room}

$(document).on 'click', '[data-behavior~=room_speaker_click]', (event) ->
  App.room.speak document.getElementById("content").value, $('[data-user]').attr('data-user'),$('[data-room]').attr('data-room') 
 
