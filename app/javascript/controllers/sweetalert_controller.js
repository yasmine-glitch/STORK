import { Controller } from "stimulus"
import swal from 'sweetalert';

export default class extends Controller {


  connect() {
    const activity = document.querySelector("#activity-name").innerText
    const date = document.querySelector("#activity-date").innerText
    console.log(activity)
    this.initSweetalert('#registration', {
      title: `Get ready for ${activity}!`,
      text: `Happening on ${date}`,
      icon: "success",
    }, (value) => {
      if (value) {
        const link = document.querySelector('.registration_hidden_btn');
        link.click();
      }
    });
    this.initSweetalert('#sweet-cancel', {
      title: "Are you sure?",
      text: "You will not be attending this event",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    },
      (willDelete) => {
        if (willDelete) {
          swal("Your booking has been cancelled", {
            icon: "success",
          }).then(
            (value) => {
              if (value) {
                const link = document.querySelector('.cancel-btn');
                link.click();
              }
            })
        } else {
          swal("Booking not cancelled!");
        }
      })
    }

  initSweetalert(selector, options = {}, callback = () => { }) {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};
}
