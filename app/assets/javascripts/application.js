//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .


$(document).ready(function(){
  resizeSearchBox();

  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('.scrollToTop').fadeIn();
    } else {
      $('.scrollToTop').fadeOut();
    }
  });

  $('.scrollToTop').click(function(){
    $('html, body').animate({scrollTop : 0},800);
    return false;
  });
});

$(document).on("page:update", function(){
  resizeSearchBox();
  hideShowCategory();
  fbPageLoad();
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover({ html : true });
});

$(document).on("page:changed", function(){
  fbPageLoad();
});

function resizeSearchBox(){
  $(".width-text").click(function(){
    $(".width-text").animate({width: '300px'},"fast");
  });

  $(".width-text").blur(function(){
    $(".width-text").animate({width: '150px'}, "fast");

  });
}

function fbPageLoad(){
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=918872404865096";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'))
}

function hideShowCategory(){

  $("#hide-show-articles").click(function(){
    $(".category-articles").slideToggle("show");
    $(this).toggleClass("fa-chevron-down fa-chevron-up");
  });

  $("#hide-show-news").click(function(){
    $(".category-news").slideToggle("show");
    $(this).toggleClass("fa-chevron-down fa-chevron-up");
  });

  $("#hide-show-computer").click(function(){
      $(".category-computer").slideToggle();
      $(this).toggleClass("fa-chevron-down fa-chevron-up");
  });

  $("#hide-show-mobile").click(function(){
      $(".category-mobile").slideToggle();
      $(this).toggleClass("fa-chevron-down fa-chevron-up");
  });

  $("#hide-show-popular-article").click(function(){
      $(".category-popular-article").slideToggle();
      $(this).toggleClass("fa-chevron-down fa-chevron-up");
  });

  $("#hide-show-more-knowledge").click(function(){
      $(".category-more-knowledge").slideToggle();
      $(this).toggleClass("fa-chevron-down fa-chevron-up");
  });
}
