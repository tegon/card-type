$(document).ready(function() {
  $('.list-card-details a').each(function() {
    if ($(this).text().match(/\[bug\]/)) {
      $(this).parent().find('.badges').append(createdBagdeHtml('bug'));
      var newTitle = $(this).text().replace(/\[bug\]/, "").replace(/^#\d+/, "");
      $(this).html(newTitle);

    }
  });
});

createdBagdeHtml = function(cardType) {
  return "<div title='" + cardType + "'" +
    "class='badge'><span class='badge-text' style='background-color: #F13C3C;" +
    "border-radius: 2px;padding: 0px 3px;color: white;'>" + cardType  + "</span> </div>"
}