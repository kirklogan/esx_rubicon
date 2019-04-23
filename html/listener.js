$(window).ready(function () {
	window.addEventListener('message', function (event) {
		var data = event.data;

		if (data.showDialog) {
			$("#helpMenu").show();
		} else {
			$("#helpMenu").hide();
		}
	});
	
	$("#helpMenu").hide();
});