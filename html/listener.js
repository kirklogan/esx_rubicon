$(window).ready(function () {
	window.addEventListener('message', function (event) {
		var data = event.data;

		if (data.showDialog) {
			$("#container").show();
		} else {
			$("#container").hide();
		}
	});
});