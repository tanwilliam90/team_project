
$(document).ready(function() {
   $("#calendar").fullCalendar({
     header: {
       left: "prev,next today",
       center: "title",
       right: "month,agendaWeek,agendaDay"
     },
     defaultView: "month",
     height: 500,
     slotMinutes: 15,
     events: "/workouts/get_workouts/",
     timeFormat: "LT",
     dragOpacity: "0.5"
  });
});
