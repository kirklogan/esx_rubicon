function debug(data) {
    $("#debug").html(JSON.stringify(data, null, 2));
}

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
            const popoverParent = $("<div>").addClass("popover popover-right");

            const menuItem = $("<li>").addClass("menu-item");
            const menuItemLink = $("<a>");
            const menuItemCount = $("<strong>").css('margin-right', '10px').html(item['count']);
            const menuItemText = $("<span>").html(item['label']);

            menuItemLink.on('click', function (e) {
                e.stopPropagation();
                $.post('http://esx_rubicon/useItem', JSON.stringify(item));
            }).on('contextmenu', function (e) {
                e.stopPropagation();
                e.preventDefault();
                $.post('http://esx_rubicon/dropItem', JSON.stringify(item));
            });

            menuItem.append(menuItemLink);
            menuItemLink.append(menuItemCount).append(menuItemText);

            listItems.push(menuItem);
        }
    }

    return listItems;
}

function nuiEventListener() {
    window.addEventListener('message', function (event) {
        try {
            if (event.data['playerData']) {
                const playerData = event.data['playerData'];

                $("#bank-account-list").html(renderBankAccounts(playerData['accounts']));
                $("#inventory-list").html(renderInventory(playerData['inventory']));
                $("#salary").html(playerData['job']['grade_salary']);
                $("#job").html(playerData['job']['label']);
                $("#rank").html(playerData['job']['grade_label']);
            }

            if (event.data['showTablet'] === true) {
                $("#tablet").show();
            }

            if (event.data['showTablet'] === false) {
                $("#tablet").hide();
            }
        } catch (err) {
            $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
        }
    });
}

function globalEventHandlers() {
    try {
        document.onkeyup = function (event) {
            if (event.key === 'Escape') {
                $.post('http://esx_rubicon/closeTablet', '{}');
            }

            if (event.key === 'F3') {
                $.post('http://esx_rubicon/closeTablet', '{}');
            }
        };

        $(document).on('click', '#closeButton', function () {
            $.post('http://esx_rubicon/closeTablet', '{}');
        });

        $(document).on('click', '#discordLink', function () {
            copyOnClick("https://discord.gg/0bdGPrFWjoTuYzVy");
        });

        $(document).on('click', '#serverLink', function () {
            copyOnClick("35.232.141.5:30120");
        });
    } catch (err) {
        $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
    }
}

$(function () {
    $("#tablet").hide();
    nuiEventListener();
    globalEventHandlers();
});