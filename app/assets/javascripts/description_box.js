$(function() {
  $(".star-attribute").click(function() {
    var this_description = $($.find(".description." + $(this).attr("class").split(" ")[1]))
    var all_other_descriptions = $($.find(".description")).not("." + this_description.attr("class").split(" ")[0])

    all_other_descriptions.hide();
    this_description.toggle();

  });
});

$(function() {
  $(".attribute").click(function() {
    var this_description = $($.find(".description." + $(this).attr("class").split(" ")[1]))
    var all_other_descriptions = $($.find(".description")).not("." + this_description.attr("class").split(" ")[0])
    debugger;

    all_other_descriptions.hide();
    this_description.toggle();
  });
});

$(function() {
  $(".transit").click(function() {
    $(this).parent().find(".description").hide();
    $(this).parent().find(".transit-desc").toggle();
  });
});
