// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/modal
//= require_tree .


$(document).ready(function(){
	$('#tutorialBtn').click(function(e){
		//alert("open!!");
		$('#pleaseWaitDialog2').modal('show');
	});
	$('#recentBtn').click(function(e){
		 e.preventDefault();
        $("#wrapper").toggleClass("toggled");
	});

	setInterval(ajaxCall, 5000); //300000 MS == 5 minutes

	function ajaxCall() {
    	$.get("/test/getList", function(data, status){
        //alert("Data: " + data + "\nStatus: " + status);
    });

    	
	}
});

jQuery(function($) {
  $("#tool-form")
    .bind("ajax:beforeSend", function(){$('#pleaseWaitDialog').modal('show');})
    .bind("ajax:complete", function() {$('#pleaseWaitDialog').modal('hide');}
    );
});