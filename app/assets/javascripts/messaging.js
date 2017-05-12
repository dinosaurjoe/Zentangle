function onNewMessage(message) {
  var newMessage = $(message).addClass('highlighted');
  $('#conversation-body').append(newMessage);
  var conversationBody = $('#conversation-body').get(0);
  conversationBody.scrollTop = conversationBody.scrollHeight;
  setTimeout(function() {
    newMessage.removeClass('highlighted');
  }, 100);
  $('#personal_message_body').val('').focus();
}
