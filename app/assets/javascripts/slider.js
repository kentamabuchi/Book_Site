'use strict'; {

  const items = document.getElementsByClassName('books__newLineup__item');

  if(items.length > 3){
    $(function () {
      $(".slider").slick({
        arrows: true,
        autoplay: true,
        autoplaySpeed: 5000,
        centerMode: true,
        centerPadding: "10%",
        dots: true,
        variableWidth: true,
        // fade: true,
        slidesToShow: 3,
        speed: 400,
      });
    });
  }else{
    $(function () {
      $(".slider").slick({
        arrows: true,
        autoplay: true,
        autoplaySpeed: 5000,
        centerMode: true,
        centerPadding: "10%",
        dots: true,
        variableWidth: true,
        // fade: true,
        slidesToShow: 1,
        speed: 400,
      });
    });
  }
}
