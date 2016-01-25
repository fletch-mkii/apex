$(function() {
  $(".accordion-title").click(function() {
    debugger;
      if ($(this).hasClass("text-left")) {
        $(this).removeClass("text-left");
        $(this).addClass("text-center animated pulse")
      } else {
        $(this).removeClass("text-center animated pulse");
        $(this).addClass("text-left")
      }
  });
});
