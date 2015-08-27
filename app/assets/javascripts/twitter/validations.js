$(function() {
	$('button[type="submit"]').on('click', function(e){
		var mobileElement = $("#inputMobile")[0];
		var isValid = true;

		if(!mobileElement.value || mobileElement.value.length < 10) {
			$(".mobile.help-block.with-errors").text("Please provide a 10 digit mobile number");
			isValid = false;
		} else {
			$(".mobile.help-block.with-errors").text("");
		}

		if(!isValid) {
			e.preventDefault();
		}
	});
});
