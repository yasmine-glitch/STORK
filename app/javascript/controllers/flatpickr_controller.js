import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";


export default class extends Controller {
  connect() {
    this.flatpickr = flatpickr(this.element, { altInput: true});
  }
  disconnect() {
    this.flatpickr.destroy()
  }
}
