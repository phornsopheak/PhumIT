//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require nprogress
//= require toastr
//= requitre jquery.clearsearch
//= require ckeditor/init
//= require ckeditor/config
//= require ckeditor/plugins/codesnippet/plugin
//= require ckeditor/plugins/lineutils/plugin
//= require ckeditor/plugins/widget/plugin
//= require_tree .


$(document).ready(function(){
  resizeSearchBox();

  hideShowCategory();
  fbPageLoad();
  twitterLoad();
  googlePlusLoad();

  $('.width-text').clearSearch();
  $(".search-nav").clearSearch();
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover({ html : true });

  setTimeout(function() {
    $(".alert").fadeOut("normal");
  }, 3000);

  setTimeout(function() {
    $(".hide-flash").fadeOut("normal");
  }, 3000);

  setTimeout(function() {
    $(".alert").fadeOut("normal");
  }, 3000);


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

function resizeSearchBox(){
  $(".width-text").click(function(){
    $(".width-text").animate({width: '300px'},"fast");
  });

  $(".width-text").blur(function(){
    $(".width-text").animate({width: '127px'}, "fast");

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

function googlePlusLoad(){
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
}

function twitterLoad(){
  !function(d,s,id){
    var js,
    fjs=d.getElementsByTagName(s)[0],
    p=/^http:/.test(d.location)?'http':'https';
    if(!d.getElementById(id)){
      js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);
    }
  }(document, 'script', 'twitter-wjs');
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
