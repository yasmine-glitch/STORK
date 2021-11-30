import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []

  connect() {
  }

  submit() {
    this.element.submit()
  }
}
