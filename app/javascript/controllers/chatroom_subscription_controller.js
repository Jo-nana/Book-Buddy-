// import { Controller } from "@hotwired/stimulus"
// import consumer from "../channels/consumer"

// export default class extends Controller {
//   static values = { chatroomId: Number, currentUserId: Number }
//   static targets = ["messages"]

//   connect() {
//     this.channel = consumer.subscriptions.create(
//       { channel: "ChatroomChannel", id: this.chatroomIdValue },
//       { received: data => this.#insertMessageAndScrollDown(data) }
//     )
//     console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
//   }

//   #insertMessageAndScrollDown(data) {
//     this.messagesTarget.insertAdjacentHTML("beforeend", data)
//     this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
//   }

//   resetForm(event) {
//     event.target.reset()
//   }
// }

import { Controller } from "stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => this._insertMessageScrollDownAndResetForm(data) }
    )
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  _insertMessageScrollDownAndResetForm(data) {
    const dataElement = this._convertStringToHTML(data)
    const senderId = parseInt(dataElement.dataset.senderId)
    const currentUserId = this.currentUserIdValue
    if (senderId !== currentUserId) {
      this._convertToReceivingMessage(dataElement)
    }
    console.log(this.messagesTarget)
    console.log(this.formTarget)

    this.messagesTarget.insertAdjacentElement("beforeend", dataElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()

    // if (this.messagesTarget.classList.contains('emptyChat')) {
    //   // console.log(this.messagesTarget.classList)
    //   Turbolinks.visit(location.toString())
    // }
  }

  _convertStringToHTML(string) {
    const element = document.createElement("div")
    element.innerHTML = string
    return element.firstChild
  }

  _convertToReceivingMessage(element) {
    console.log(element)
    element.classList.remove("msg-mine")
    element.classList.add("msg-yours")
  }
}
