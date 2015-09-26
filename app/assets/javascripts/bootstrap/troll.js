$(function(){
  $(".cta").on('click', function(e) {
     // prevent default anchor click behavior
     e.preventDefault();
     var identifier = '#middle-section';
     // animate
     $('html, body').animate({
         scrollTop: $(identifier).offset().top
       }, 600, function(){
         // when done, add hash to url
         // (default click behaviour)
         window.location.hash = identifier;
       });
  });
});
