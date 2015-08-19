$(function() {
	$('button[type="submit"]').on('click', function(e){
		var emailElement = $("#inputEmail")[0];
		var mobileElement = $("#inputMobile")[0];
		var isValid = true;

		if(!emailElement.value || !emailElement.value.match(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/)) {
			$(".email.help-block.with-errors").text("Bruh, that email address is invalid!");
			isValid = false;
		} else {
			$(".email.help-block.with-errors").text("");
		}

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