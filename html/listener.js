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

function renderBankAccounts(accounts) {
    const listItems = [];

    listItems.push(
        $("<li/>")
            .addClass("divider")
            .attr("data-content", "FINANCES")
    );

    for (const account of accounts) {
        listItems.push(
            $("<li/>")
                .addClass("menu-item")
                .html("<a><strong>" + account['label'] + ": $</strong>" + account['money'] + "</a>")
        );
    }

    return listItems;
}

function renderInventory(inventory) {
    const listItems = [];

    listItems.push(
        $("<li/>")
            .addClass("divider")
            .attr("data-content", "INVENTORY")
    );

    for (const item of inventory) {
        if (item['count'] > 0) {
            listItems.push(
                $("<li/>")
                    .addClass("menu-item")
                    .html("<a style='width: 100%'>" +
                        "<div style='width: 20px; display: inline-block'><strong>" + item['count'] + " - </strong></div>" +
                        "<span>" + item['label'] + "</span>" +
                        "</a>"
                    )
            );
        }
    }

    return listItems;
}

function nuiEventListener() {
    window.addEventListener('message', function (event) {
        try {
            const playerData = event.data['playerData'];

            if (event.data['showDialog']) {
                $("#bank-account-list").html(renderBankAccounts(playerData['accounts']));
                $("#inventory-list").html(renderInventory(playerData['inventory']));

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
            if (event.key === 'Escape') {
                $.post('http://esx_rubicon/closeTablet', '{}');
            }

            if (event.key === 'F3') {
                $.post('http://esx_rubicon/closeTablet', '{}');
            }
        };

        $('#closeButton').on('click', function () {
            $.post('http://esx_rubicon/closeTablet', '{}');
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