jQuery(document).on 'turbolinks:load', ->
  #messages = $('#conversation')

  App.conversation = App.cable.subscriptions.create {
    channel: "ConversationsChannel"
    conversation: $('#conversation').data('conversation-id')
  },

  connected: ->

  disconnected: ->

  received: (data) ->
    $('#conversation')
    .append("<span>" + data['message'] + "</span><br/>")
    element = document.getElementById("msg-box");
    element.scrollTop = element.scrollHeight;
    #alert $('#conversation').data('conversation-id')

  speak: (message) ->
    #alert $('#conversation').data('user-id')
    @perform 'speak', message: message, conversation: $('#conversation').data('conversation-id'), user: $('#conversation').data('user-id')  # this adds it into db

$(document).on 'keypress', '[data-behavior~=conversation_msg]', (event) ->
  if event.keyCode is 13
    App.conversation.speak event.target.value
    event.target.value = ''
    event.preventDefault()


    #$('#conversation')
    #.append("<span>" + message + "</span>")

  # send_message: (message, chat_room_id) ->
  #   @perform 'send_message', message: message, chat_room_id: chat_room_id
