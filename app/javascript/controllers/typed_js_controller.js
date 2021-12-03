import { Controller } from "@hotwired/stimulus";
// Don't forget to import the NPM package
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    this.typed = new Typed(this.element, {
      strings: ["here.", "there.", "wherever you go!"],
      typeSpeed: 50,
      loop: true
    });
  }

  disconnect() {
    this.typed.destroy()
  }
}
