// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require owl.carousel
//= require jquery.countdown
//= require jquery.countdown-es
//= require jquery.downCount
//= require nouislider
//= require rails-ujs
//= require jquery.sticky
//= require pace/pace
//= require jquery-star-rating
//= require wow
//= require gmaps
//= require swiper
//= require main
//= require turbolinks


var swiperH = new Swiper('.swiper-coverflow', {
    pagination: '.swiper-pagination',
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    paginationClickable: true,
    effect: 'coverflow',
    centeredSlides: true,
    slidesPerView: 'auto',
    loop: true,
    coverflow: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows : true
    }
});
