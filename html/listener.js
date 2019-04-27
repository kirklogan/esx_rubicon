$(window).ready(function () {
	$("#tablet").hide();
	
	window.addEventListener('message', function (event) {
		var playerData = event.data.playerData;

		if (event.data.showTablet) {
			$("#money").html(playerData.accounts[0].money);
			$("#job").html(playerData.job.label);
			$("#rank").html(playerData.job.grade_label);
			$("#salary").html(playerData.job.grade_salary);
			$("#tablet").show();
		} else {
			$("#tablet").hide();
		}
	});
	
	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://esx_rubicon/escape', '{}');
		}
	};
	
	document.onkeyup = function (data) {
		if (data.which == 114) {
			$.post('http://esx_rubicon/F3', '{}');
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