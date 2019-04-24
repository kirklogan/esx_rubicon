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
	});
	
	$('#discordLink').on('click', function () {
		const el = document.createElement('textarea');
	    el.value = "https://discord.gg/0bdGPrFWjoTuYzVy";
	    document.body.appendChild(el);
	    el.select();
	    document.execCommand('copy');
	    document.body.removeChild(el);
		console.log('test');
	});
	
	$('#serverLink').on('click', function () {
		const el = document.createElement('textarea');
	    el.value = "https://discord.gg/0bdGPrFWjoTuYzVy";
	    document.body.appendChild(el);
	    el.select();
	    document.execCommand('copy');
	    document.body.removeChild(el);
	});
});