import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static targets = ["map"]
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    this._addMarkersToMap();
    this._fitMapToMarkers();
  }

  _addMarkersToMap() {
    // définir une variable d'array vide pour y insérer les marker un à un
    this.markersArray = []
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);
      const markerElement = new mapboxgl.Marker()
      markerElement.setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map)
      markerElement._element.id = `activity_${marker.id}`
      // insérer chq markeur dans l'array
      this.markersArray.push(markerElement)
    });
  }
  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 0 });
  }

  openPopup(event) {
    // console.log("enter")
    const hovered_card = event.currentTarget
    const id = hovered_card.id
    this.markersArray.forEach((marker) => {
      const popup = marker.getPopup()
      const isPopupOpen = popup.isOpen()
      if (isPopupOpen){
        marker.togglePopup()
      }
      const markerId = marker._element.id
      if (id == markerId) {
        marker.togglePopup()
       }
    })
  }
}
