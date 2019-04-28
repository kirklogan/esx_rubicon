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
    const header = $("<li>").addClass("divider").attr("data-content", "FINANCES");

    listItems.push(header);

    for (const account of accounts) {
        const menuItem = $("<li>").addClass("menu-item");
        const menuItemLink = $("<a>");
        const menuItemLabel = $("<strong>").css('margin-right', '10px').html(account['label']);
        const menuItemText = $("<span>").html("$" + account['money']);

        menuItem.append(menuItemLink);
        menuItemLink.append(menuItemLabel).append(menuItemText);

        listItems.push(menuItem);
    }

    return listItems;
}

function renderInventory(inventory, loadout) {
    const listItems = [];
    const itemsHeader = $("<li>").addClass("divider").attr("data-content", "ITEMS");
    const weaponsHeader = $("<li>").addClass("divider").attr("data-content", "WEAPONS");

    listItems.push(itemsHeader);

    for (const item of inventory) {
        if (item['count'] > 0) {
            item.type = 'item_standard';

            const menuItem = $("<li>").addClass("menu-item");
            const menuItemLink = $("<a>");
            const menuItemCount = $("<div>")
                .addClass('text-bold')
                .css('display', 'inline-block')
                .css('width', '30px')
                .css('color', 'blue')
                .html(item['count']);
            const menuItemText = $("<span>").html(item['label']);

            menuItemLink.on('click', () => {
                if (item['usable']) {
                    $.post('http://esx_rubicon/useItem', JSON.stringify(item));
                }
            }).on('contextmenu', () => {
                if (item['canRemove']) {
                    $.post('http://esx_rubicon/dropItem', JSON.stringify(item));
                }
            });

            menuItem.append(menuItemLink);
            menuItemLink.append(menuItemCount).append(menuItemText);

            listItems.push(menuItem);
        }
    }

    listItems.push(weaponsHeader);

    for (const item of loadout) {
        item.type = 'item_weapon';

        const menuItem = $("<li>").addClass("menu-item");
        const menuItemLink = $("<a>");
        const menuItemCount = $("<div>")
            .addClass('text-bold')
            .css('display', 'inline-block')
            .css('width', '30px')
            .css('color', 'blue')
            .html(item['ammo']);
        const menuItemText = $("<span>").html(item['label']);

        menuItemLink.on('contextmenu', () => {
            $.post('http://esx_rubicon/dropItem', JSON.stringify(item));
        });

        menuItem.append(menuItemLink);
        menuItemLink.append(menuItemCount).append(menuItemText);

        listItems.push(menuItem);
    }

    return listItems;
}

function nuiEventListener() {
    window.addEventListener('message', (event) => {
        try {
            if (event.data['playerData']) {
                const playerData = event.data['playerData'];
                $("#rankBtnEmt").hide();
                $("#rankBtnPolice").hide();

                //Button status for professions//
                if (playerData['job']['label'] === 'Police') {
                    $("#rankBtnPolice").show();
                } else if (playerData['job']['label'] === 'EMS') {
                    $("#rankBtnEmt").show();
                }
                $("#bank-account-list").html(renderBankAccounts(playerData['accounts']));
                $("#inventory-list").html(renderInventory(playerData['inventory'], playerData['loadout']));
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
        document.onkeyup = (event) => {
            if (event.key === 'Escape') {
                $.post('http://esx_rubicon/closeTablet', '{}');
            }

            if (event.key === 'F3') {
                $.post('http://esx_rubicon/closeTablet', '{}');
            }
        };

        $(document).on('click', '#closeButton', () => {
            $.post('http://esx_rubicon/closeTablet', '{}');
        });

        $(document).on('click', '#discordLink', () => {
            copyOnClick("https://discord.gg/0bdGPrFWjoTuYzVy");
        });

        $(document).on('click', '#serverLink', () => {
            copyOnClick("35.232.141.5:30120");
        });
    } catch (err) {
        $.post('http://esx_rubicon/javascriptError', JSON.stringify(err.message));
    }
}

$(() => {
    $("#tablet").hide();
    nuiEventListener();
    globalEventHandlers();
});