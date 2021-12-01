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
    console.log("hello from stimulus")
  }

  openPopup(event) {
    console.log("open")
    const hovered_card = event.currentTarget
    console.log(hovered_card)
    const id = hovered_card.id.split('_')[1]
    console.log(id)
    var markers = document.querySelectorAll('.mapboxgl-marker')
    // console.log(markers)
    markers.forEach(function(marker) {
      // console.log(marker.id)
      if (id == marker.id) {
        // console.log("click")
        marker.click()
        marker.classList.add('hovered_marker')
      }
      else {
        console.log("no click")
        marker.classList.remove('hovered_marker')
      }
    })
  }

  closePopup(event) {
    console.log("close")
    const hovered_card = event.currentTarget
    const id = hovered_card.id.split('_')[1]
    var markers = document.querySelectorAll('.mapboxgl-marker')
    markers.forEach(function (marker) {
      marker.click()
    })
  }
}
