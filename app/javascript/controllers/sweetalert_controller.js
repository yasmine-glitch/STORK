import { Controller } from "stimulus"
import swal from 'sweetalert';

export default class extends Controller {


  connect() {
    const activity = document.querySelector(".activity-main-infos h3").innerText
    const date = document.querySelector(".activity-main-infos .date").innerText
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
