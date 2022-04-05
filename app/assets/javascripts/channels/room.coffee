#最新盤ですよ
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # 通信が確立された時の処理

  disconnected: ->
    # 通信が切断された時の処理

  received: (data) ->
    # データが送信されてきた時の処理]
    alert data["message"]
    $('#add-message').append("<p>" + data["message"] + "</p>");

  speak: (message) ->
    # channelのspeakアクションにmessageパラメータを渡す
    @perform 'speak', message: message

# チャットを送る
$(document).on 'keypress', '[data-behavior~=room_speaker_keypress]', (event) ->
  # return(Enter)が押された時
  if event.keyCode is 13
    #channel speakへ、event.target.valueを引数に
    App.room.speak event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')
    # inputの中身を空に
    # event.target.value = ''
    # alert()
    #event.preventDefault()

$(document).on 'click', '[data-behavior~=room_speaker_click]', (event) ->
    event.target.value = document.getElementById("content").value
    App.room.speak event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')
    # inputの保存の文字を残すため
    document.getElementById("save").value = "保存"