'use strict'; {


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
}
