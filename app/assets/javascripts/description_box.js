$(function() {
  $(".attribute").click(function() {
    $(this).parent().parent().parent().find(".transit-desc").hide();
    $(this).parent().parent().parent().find(".description").hide();
    $(this).parent().parent().parent().find(".description").not(".transit-desc").toggle();
  });
});

$(function() {
  $(".transit").click(function() {
    $(this).parent().find(".description").hide();
    $(this).parent().find(".transit-desc").toggle();
  });
});
