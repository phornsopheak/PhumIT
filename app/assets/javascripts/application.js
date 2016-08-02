//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require nprogress
//= require toastr
//= require owl.carousel
//= requitre jquery.clearsearch
//= requirejquery.sticky
//= require ckeditor/init
//= require ckeditor/config
//= require ckeditor/plugins/codesnippet/plugin
//= require ckeditor/plugins/lineutils/plugin
//= require ckeditor/plugins/widget/plugin
//= require_tree .


$(document).ready(function(){
  resizeSearchBox();
  loadOwl();
  fbPageLoad();
  twitterLoad();
  googlePlusLoad();

  $('.width-text').clearSearch();
  $(".search-nav").clearSearch();
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover({ html : true });

  $("#header").sticky({ topSpacing: 0 });

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

function loadOwl(){

  var time = 7; // time in seconds

  var $progressBar,
      $bar,
      $elem,
      isPause,
      tick,
      percentTime;

    //Init the carousel
    $("#owl-demo").owlCarousel({
      slideSpeed : 500,
      paginationSpeed : 500,
      singleItem : true,
      afterInit : progressBar,
      afterMove : moved,
      startDragging : pauseOnDragging,
      navigation: true,
      pagination: false,
      lazyLoad : true,
      navigationText: [
      "<i class='fa fa-chevron-left'></i>",
      "<i class='fa fa-chevron-right'></i>"
      ]
    });

    //Init progressBar where elem is $("#owl-demo")
    function progressBar(elem){
      $elem = elem;
      //build progress bar elements
      buildProgressBar();
      //start counting
      start();
    }

    //create div#progressBar and div#bar then prepend to $("#owl-demo")
    function buildProgressBar(){
      $progressBar = $("<div>",{
        id:"progressBar"
      });
      $bar = $("<div>",{
        id:"bar"
      });
      $progressBar.append($bar).prependTo($elem);
    }

    function start() {
      //reset timer
      percentTime = 0;
      isPause = false;
      //run interval every 0.01 second
      tick = setInterval(interval, 10);
    };

    function interval() {
      if(isPause === false){
        percentTime += 1 / time;
        $bar.css({
           width: percentTime+"%"
         });
        //if percentTime is equal or greater than 100
        if(percentTime >= 100){
          //slide to next item
          $elem.trigger('owl.next')
        }
      }
    }

    //pause while dragging
    function pauseOnDragging(){
      isPause = true;
    }

    //moved callback
    function moved(){
      //clear interval
      clearTimeout(tick);
      //start again
      start();
    }
}
