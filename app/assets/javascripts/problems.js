$(function(){
  $("a.toggle_notes").click(function(){
    console.log($(this).closest(".problem").find(".notes"));
    $(this).closest(".problem").find(".notes").slideToggle("fast");
  });
});