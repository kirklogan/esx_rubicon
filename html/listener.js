$(window).ready(function () {
	$("#helpMenu").hide();
	
	window.addEventListener('message', function (event) {
		var data = event.data;

		if (data.showDialog) {
			$("#helpMenu").show();
		} else {
			$("#helpMenu").hide();
		}
	});
	
	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://esx_rubicon/escape', '{}');
		}
	};
	
	$('#closeButton').on('click', function () {
		$.post('http://esx_rubicon/escape', '{}');
	})
});