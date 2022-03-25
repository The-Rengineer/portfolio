# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
App.rooms = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # 通信が確立された時の処理

  disconnected: ->
    # 通信が切断された時の処理

  received: (data) ->
    # データが送信されてきた時の処理

  speak: (message) ->
    # channelのspeakアクションにmessageパラメータを渡す
    @perform 'speak', message: message

# チャットを送る
$(document).on 'keypress', '[data-behavior~=rooms_speaker]', (event) ->
  # return(Enter)が押された時
  if event.keyCode is 13
    #channel speakへ、event.target.valueを引数に
    App.rooms.speak event.target.value
    # inputの中身を空に
    event.target.value = ''
    alert()
    event.preventDefault()
