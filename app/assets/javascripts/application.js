// This is a manifest file that"ll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin"s vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It"s not advisable to add code directly here, but if you do, it"ll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require bootstrap-datepicker


/* global $ */

function openModal() {
    $("document").ready(function(){
        document.getElementById("room-modal").style.display = "block";
    });
}

function closeModal() {
    document.getElementById("room-modal").style.display = "none";
}

var slideIndex = 1;
showSlide(1);

function plusSlides(n) {
  showSlide(slideIndex += n);
}

function currentSlide(n) {
  showSlide(slideIndex = n);
}

function showSlide(n) {
    var i;
    console.log(document.getElementsByClassName("roomSlide"));
    
    $("document").ready(function(){
        var slides = document.getElementsByClassName("roomSlide");
        if (n > slides.length) {
            slideIndex = 1;
        }
        if (n < 1) {
            slideIndex = slides.length;
        }
        for(i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex - 1].style.display = "block";
        console.log(slides[slideIndex - 1]);
    });
}

$(document).on("turbolinks:load", function() {
    
  $(".edit-field").on("click", function(event) {
    event.target.parentElement.lastElementChild.style.display ="block";
  });
  
  $(".accept").on("click", function(event) {
        console.log("testing");
  });
  $("#daterange").daterangepicker({
      autoUpdateInput: true,
      autoApply: true,
      showDropdowns: true,
  });
  
  $("#daterange").on("apply.daterangepicker", function(ev, picker){
      $("#booking_request_checkin").val(picker.startDate.format("YYYY-MM-DD"));
      $("#booking_request_checkout").val(picker.endDate.format("YYYY-MM-DD"));
  });
  document.getElementById("focus").focus();
});
