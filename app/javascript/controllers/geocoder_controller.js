import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address", "autocomplete"]

  connect() {
    console.log(this.addressTarget.value);
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,place,postcode,locality,address",
      placeholder: this.addressTarget.value == "" ? "Search for a city" : this.addressTarget.value,
      clearOnBlur:false,
      clearAndBlurOnEsc:false,
      limit: 4,
      language: "en",
    });
    this.geocoder.addTo(this.autocompleteTarget);
    this.geocoder.on("result", event => {
      this._setInputValue(event)
      this.element.submit()
    });
    this.geocoder.on("clear", () => this._clearInputValue());
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  _setInputValue(event) {
    this.addressTarget.value = event.result["place_name"];
  }

  _clearInputValue() {
    this.addressTarget.value = "";
  }
}
