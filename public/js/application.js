$(document).ready(function(){

  $("div.card").on("click", function(){
    $("div.card").removeClass("neg");
    $("div.card").removeClass("pos");
    $("div.card").removeClass("current");

    cardId = $(this).attr("id");
    negativeId = ".negative-"+cardId;
    positiveId = ".positive-"+cardId;
    $(this).addClass("current")
    $(negativeId).addClass("neg");
    $(positiveId).addClass("pos");
  });

});
