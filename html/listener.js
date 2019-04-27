function copyOnClick (textToCopy) {
    try {
        const el = document.createElement('textarea');
        el.value = textToCopy;
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
    } catch (err) {
        $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
    }
}

$(window).ready(function () {
    $("#tablet").hide();

    window.addEventListener('message', function (event) {
        try {
            const playerData = event.data['playerData'];

            if (event.data['showDialog']) {
                $("#money").html('');
                $("#job").html(playerData['job']['label']);
                $("#rank").html('');
                $("#salary").html('');
                $("#debug").html('');
                $("#tablet").show();
            } else {
                $("#tablet").hide();
            }
        } catch (err) {
            $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
        }
    });

    document.onkeyup = function (data) {
        if (data.which === 27) {
            $.post('http://esx_rubicon/escape', '{}');
        }
    };

    $('#closeButton').on('click', function () {
        $.post('http://esx_rubicon/escape', '{}');
    });

    $('#discordLink').on('click', function () {
        copyOnClick("https://discord.gg/0bdGPrFWjoTuYzVy");
    });

    $('#serverLink').on('click', function () {
        copyOnClick("35.232.141.5:30120");
    });
});