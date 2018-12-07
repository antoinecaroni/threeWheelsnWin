import 'flatpickr/dist/flatpickr.css'
import flatpickr from "flatpickr";

const start_date = document.getElementById("booking_start_date")
const end_date = document.getElementById("booking_end_date")

if (start_date) {
flatpickr(start_date, {
  disable: JSON.parse(end_date.dataset.bookingDates),
  dateFormat: "Y-m-d"
});
}

if (end_date) {flatpickr(end_date, {
  disable: JSON.parse(end_date.dataset.bookingDates),
  dateFormat: "Y-m-d",
});
}
