
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
     dragOpacity: "0.5",
     eventClick:  function(event, jsEvent, view) {
         $('#modalTitle').html(event.title);
         $('#instructor').html(event.instructor);
         $('#description').html(event.description);
         $('#location').html(event.location);
         $('#date').html(event.date);
         $('#time').html(event.time);
         $('#category').html(event.category);
         $('#price').html(event.price);
         $('#duration').html(event.duration);
         $('#level').html(event.level);
         $('#eventUrl').attr('href',event.url);
         $('#fullCalModal').modal();
         return false;
     }
  });
});
