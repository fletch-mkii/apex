$(function() {
  $(".att-name").click(function() {
    $(this).parent().parent().children().children().not(".att-name").hide();
    $(this).siblings().toggle();
  });
});
