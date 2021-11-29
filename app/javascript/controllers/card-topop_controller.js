// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {

  }

  openPopup(event) {
    //console.log(event.currentTarget.id)
    const hovered_card = event.currentTarget
    const id = hovered_card.id.split('_')[1]
    var markers = document.querySelectorAll('.mapboxgl-marker')
    markers.forEach(function(marker) {
      if (id == marker.id) {
        marker.click()
        marker.classList.add('hovered_marker')
      }
      else {
        marker.classList.remove('hovered_marker')
      }
    })
  }

  leave(event) {
    const hovered_card = event.currentTarget
    const id = hovered_card.id.split('_')[1]
    var markers = document.querySelectorAll('.mapboxgl-marker')
    markers.forEach(function (marker) {
      marker.click()
    })
  }
}
