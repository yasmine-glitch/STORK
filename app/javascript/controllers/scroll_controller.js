// app/javascript/controllers/scroll_controller.js

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["test", "listhide"];

  connect() {
    console.log(this.testTarget);
    console.log(this.listhideTarget)
    this.testTarget.addEventListener("click",(event)=>{
      this.listhideTarget.classList.toggle("left-participants-hidden");
    })

  }
}
