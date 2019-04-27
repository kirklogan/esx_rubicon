function copyOnClick(textToCopy) {
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

function nuiEventListener() {
    window.addEventListener('message', function (event) {
        try {
            const playerData = event.data['playerData'];

            if (event.data['showDialog']) {
                $("#money").html(playerData['accounts'][0]['money']);
                $("#salary").html(playerData['job']['grade_salary']);
                $("#job").html(playerData['job']['label']);
                $("#rank").html(playerData['job']['grade_label']);
                $("#debug").html('');
                $("#tablet").show();
            } else {
                $("#tablet").hide();
            }
        } catch (err) {
            $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
        }
    });
}

function eventHandlers() {
    try {
        document.onkeyup = function (event) {
            $.post('http://esx_rubicon/javascriptError', JSON.stringify(event.code));

            if (event.code === 'Escape') {
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
    } catch (err) {
        $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
    }
}

$(function () {
    $("#tablet").hide();
    nuiEventListener();
    eventHandlers();
});