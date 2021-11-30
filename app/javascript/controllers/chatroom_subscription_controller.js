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
        const currentuserId = document.body.getAttribute("data-current-user-id")
        const messageWrappers = document.querySelectorAll(".message-wrapper")
        const lastMessage = messageWrappers[messageWrappers.length - 1]
        const usermessageId = lastMessage.getAttribute("data-user-id")
        console.log(currentuserId);
        console.log(usermessageId);

        if (currentuserId !== usermessageId) {
          lastMessage.querySelector(".message-right").classList.add("d-none")
          lastMessage.querySelector(".message-left").classList.remove("d-none")
        }
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
