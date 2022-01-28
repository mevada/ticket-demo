import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("hello");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    alert(data['message']);
  },

  speak: function() {
    return this.perform('speak', { message: message});
  }

  (function() {
    $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
      if (event.keyCode === 13) {
        App.room.speak(event.target.value);
        event.target.value = '';
        return event.preventDefault();
      }
    });
  }).call(this);
});
