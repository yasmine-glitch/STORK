import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["allmessages"]

  connect() {
    this.allmessagesTarget.scrollTop = this.allmessagesTarget.scrollHeight
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },

      { received: data => {
        // const last_message = document.querySelector(".new_message");
        // if (last_message) {
        //   last_message.classList.remove("new_message")
        // }
        this.allmessagesTarget.insertAdjacentHTML("beforeend", data);
        this.allmessagesTarget.scrollTop = this.allmessagesTarget.scrollHeight
      }
    }
        // this.element.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
