var showDescriptions = function(descType) {
  $(descType).click(function() {
    debugger;
    var this_description = $($.find(".description." + $(this).attr("class").split(" ")[1]));
    var all_other_descriptions = $($.find(".description")).not("." + this_description.attr("class").split(" ")[0]);
    var this_attribute = $($.find("." + $(this).attr("class").split(" ")[1])).not(".description");
    var all_other_attributes = $($.find(descType)).not("." + this_description.attr("class").split(" ")[0]);

    all_other_descriptions.hide();
    this_description.toggle();
    this_attribute.toggleClass("selected");
    all_other_attributes.removeClass("selected")
  });
};

$(function() {
  showDescriptions(".star-attribute")
  showDescriptions(".attribute")

  $(".transit").click(function() {
    $(this).parent().find(".description").hide();
    $(this).parent().find(".transit-desc").toggle();
  });
});
