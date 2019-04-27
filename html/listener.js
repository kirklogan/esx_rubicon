$(window).ready(function () {
	$("#tablet").hide();
	
	window.addEventListener('message', function (event) {
		try {
			var playerData = event.data.playerData;

			if (event.data.showDialog) {
				$("#money").html('');
				$("#job").html(playerData.job.label);
				$("#rank").html('');
				$("#salary").html('');
				$("#debug").html('');
				$("#tablet").show();
			} else {
				$("#tablet").hide();
			}
		} catch (err) {
			$.post('http://esx_rubicon/javascriptError', JSON.stringify(err));
		}
	});
	
	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://esx_rubicon/escape', '{}');
			$.post('http://esx_rubicon/javascriptError', JSON.stringify({});
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