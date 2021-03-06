import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

flatpickr(".datepicker", {
})

flatpickr(".timepicker", {
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
  time_24hr: true,
  minTime: "10:00",
  maxTime: "20:00",
  minuteIncrement: 30
})
