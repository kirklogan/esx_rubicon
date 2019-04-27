#!/bin/bash

DB_PASSWORD=
RECREATE_DATABASE=false

#REMOVE PLUGINS SO THEY CAN BE UPDATED
echo "Removing old plugin versions"
rm -fr async
rm -fr mysql-async
rm -fr essentialmode
rm -fr esplugin_mysql
rm -fr [essential]/es_extended
rm -fr [esx]/[ui]/esx_menu_default
rm -fr [esx]/[ui]/esx_menu_dialog
rm -fr [esx]/[ui]/esx_menu_list
rm -fr cron
rm -fr NativeUI
rm -fr [esx]/esx_addonaccount
rm -fr [esx]/esx_addoninventory
rm -fr [esx]/esx_rpchat
rm -fr [esx]/skinchanger
rm -fr [esx]/esx_skin
rm -fr [esx]/instance
rm -fr [esx]/esx_status
rm -fr [esx]/esx_atm
rm -fr [esx]/esx_basicneeds
rm -fr [esx]/esx_billing
rm -fr [esx]/esx_society
rm -fr [esx]/esx_service
rm -fr [esx]/esx_datastore
rm -fr [esx]/esx_license
rm -fr [esx]/esx_identity
rm -fr [esx]/esx_vehicleshop
rm -fr [esx]/esx_joblisting
rm -fr [esx]/esx_jobs
rm -fr [esx]/esx_policejob
rm -fr [esx]/esx_taxijob
rm -fr [esx]/esx_ambulancejob
rm -fr [esx]/esx_holdup
rm -fr [esx]/esx_bankerjob
rm -fr [esx]/esx_shops
rm -fr [esx]/esx_weaponshop
rm -fr [esx]/esx_drugs
rm -fr [esx]/esx_phone
rm -fr [esx]/esx_dmvschool
rm -fr [esx]/esx_clotheshop
rm -fr [esx]/esx_voice
rm -fr [esx]/esx_barbershop
rm -fr [esx]/esx_accessories
rm -fr [esx]/esx_boat
rm -fr [esx]/airports
rm -fr [esx]/esx_property
rm -fr [esx]/shield
rm -fr [esx]/slashtires
rm -fr [esx]/esx_blackjob
rm -fr [esx]/esx_rubicon

#DOWNLOAD LATEST VERSION OF PLUGINS
echo "Downloading updates"
git clone -q https://github.com/ESX-Org/async async
git clone -q https://github.com/brouznouf/fivem-mysql-async mysql-async
git clone -q https://github.com/kanersps/essentialmode essentialmode
git clone -q https://github.com/kanersps/esplugin_mysql esplugin_mysql
git clone -q https://github.com/ESX-Org/es_extended [essential]/es_extended
git clone -q https://github.com/ESX-Org/esx_menu_default [esx]/[ui]/esx_menu_default
git clone -q https://github.com/ESX-Org/esx_menu_dialog [esx]/[ui]/esx_menu_dialog
git clone -q https://github.com/ESX-Org/esx_menu_list [esx]/[ui]/esx_menu_list
git clone -q https://github.com/ESX-Org/cron cron
git clone -q https://github.com/iTexZoz/NativeUILua_Reloaded NativeUI
git clone -q https://github.com/ESX-Org/esx_addonaccount [esx]/esx_addonaccount
git clone -q https://github.com/ESX-Org/esx_addoninventory [esx]/esx_addoninventory
git clone -q https://github.com/ESX-Org/esx_rpchat [esx]/esx_rpchat
git clone -q https://github.com/ESX-Org/skinchanger [esx]/skinchanger
git clone -q https://github.com/ESX-Org/esx_skin [esx]/esx_skin
git clone -q https://github.com/ESX-Org/instance [esx]/instance
git clone -q https://github.com/FXServer-ESX/fxserver-esx_status [esx]/esx_status
git clone -q https://github.com/ESX-Org/esx_atm [esx]/esx_atm
git clone -q https://github.com/ESX-Org/esx_basicneeds [esx]/esx_basicneeds
git clone -q https://github.com/ESX-Org/esx_billing [esx]/esx_billing
git clone -q https://github.com/ESX-Org/esx_society [esx]/esx_society
git clone -q https://github.com/ESX-Org/esx_service [esx]/esx_service
git clone -q https://github.com/ESX-Org/esx_datastore [esx]/esx_datastore
git clone -q https://github.com/ESX-Org/esx_license [esx]/esx_license
git clone -q https://github.com/ESX-Org/esx_identity [esx]/esx_identity
git clone -q https://github.com/ESX-Org/esx_vehicleshop [esx]/esx_vehicleshop
git clone -q https://github.com/ESX-Org/esx_joblisting [esx]/esx_joblisting
git clone -q https://github.com/ESX-Org/esx_jobs [esx]/esx_jobs
git clone -q https://github.com/ESX-Org/esx_policejob [esx]/esx_policejob
git clone -q https://github.com/ESX-Org/esx_taxijob [esx]/esx_taxijob
git clone -q https://github.com/ESX-Org/esx_ambulancejob [esx]/esx_ambulancejob
git clone -q https://github.com/ESX-Org/esx_holdup [esx]/esx_holdup
git clone -q https://github.com/ESX-Org/esx_bankerjob [esx]/esx_bankerjob
git clone -q https://github.com/ESX-Org/esx_shops [esx]/esx_shops
git clone -q https://github.com/ESX-Org/esx_weaponshop.git [esx]/esx_weaponshop
git clone -q https://github.com/ESX-Org/esx_drugs [esx]/esx_drugs
git clone -q https://github.com/ESX-Org/esx_phone [esx]/esx_phone
git clone -q https://github.com/ESX-Org/esx_dmvschool [esx]/esx_dmvschool
git clone -q https://github.com/ESX-Org/esx_clotheshop [esx]/esx_clotheshop
git clone -q https://github.com/ESX-Org/esx_voice [esx]/esx_voice
git clone -q https://github.com/ESX-Org/esx_barbershop [esx]/esx_barbershop
git clone -q https://github.com/ESX-Org/esx_accessories [esx]/esx_accessories
git clone -q https://github.com/ESX-Org/esx_boat [esx]/esx_boat
git clone -q https://github.com/FiveM-Scripts/airports [esx]/airports
git clone -q https://github.com/ESX-Org/esx_property [esx]/esx_property
git clone -q https://github.com/xander1998/shield [esx]/shield
git clone -q https://github.com/xander1998/slashtires [esx]/slashtires

git clone -q https://github.com/MrMallenby/BlackMarket.git [esx]/tmp
sudo mv [esx]/tmp/esx_blackjob [esx]/
sudo rm -r [esx]/tmp

git clone -q https://github.com/kirklogan/esx_rubicon [esx]/esx_rubicon
cd [esx]/esx_rubicon
git fetch
git checkout fivem-XXX
git pull

#CHANGE LOCALE OF ALL CONFIG FILES TO ENGLISH
echo "Updating config files"
cd ../../
grep -rl "'fr'" ./*/*/config.lua | xargs sed -i "s/'fr'/'en'/g"

rm \[esx\]/esx_atm/html/ui.html & mv \[esx\]/esx_atm/html/ui_en.html \[esx\]/esx_atm/html/ui.html
rm \[esx\]/esx_phone/html/ui.html & mv \[esx\]/esx_phone/html/ui_en.html \[esx\]/esx_phone/html/ui.html
rm \[esx\]/esx_dmvschool/html/ui.html & mv \[esx\]/esx_dmvschool/html/ui_en.html \[esx\]/esx_dmvschool/html/ui.html

rm essentialmode/server/util.lua & cp ~/util.lua essentialmode/server/util.lua
rm \[esx\]/esx_policejob/config.lua & cp ~/esx_police_config.lua \[esx\]/esx_policejob/config.lua
rm \[esx\]/esx_rpchat/config.lua & cp ~/esx_rpchat_config.lua \[esx\]/esx_rpchat/config.lua
rm \[esx\]/esx_society/config.lua & cp ~/esx_society_config.lua \[esx\]/esx_society/config.lua
rm \[esx\]/esx_holdup/config.lua & cp ~/esx_holdup_config.lua \[esx\]/esx_holdup/config.lua
rm \[esx\]/esx_taxijob/config.lua & cp ~/esx_taxijob_config.lua \[esx\]/esx_taxijob/config.lua
rm \[esx\]/esx_vehicleshop/config.lua & cp ~/esx_vehicleshop_config.lua \[esx\]/esx_vehicleshop/config.lua
rm \[esx\]/esx_weaponshop/config.lua & cp ~/esx_weaponshop_config.lua \[esx\]/esx_weaponshop/config.lua
rm \[esx\]/airports/config.lua & cp ~/airports_config.lua \[esx\]/airports/config.lua

if $RECREATE_DATABASE ; then
	#CREATE MYSQL DATABASE
	echo "Creating ESX database"
	mysql -u fivem -p$DB_PASSWORD -e "DROP DATABASE IF EXISTS essentialmode"
	mysql -u fivem -p$DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS essentialmode"

	mysql -u fivem -p$DB_PASSWORD essentialmode < esplugin_mysql/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[essential\]/es_extended/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_addonaccount/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_addoninventory/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_status/*.sql

	rm -f \[esx\]/esx_basicneeds/esx_basicneeds.sql
	cp ~/esx_basicneeds.sql \[esx\]/esx_basicneeds/esx_basicneeds.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_basicneeds/*.sql

	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_billing/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_society/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_datastore/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_license/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_identity/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_vehicleshop/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_joblisting/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_jobs/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_policejob/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_taxijob/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_ambulancejob/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_bankerjob/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_shops/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_weaponshop/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_drugs/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_phone/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_dmvschool/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_accessories/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_boat/*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_property/localization/en_*.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_property/offices.sql
	mysql -u fivem -p$DB_PASSWORD essentialmode < \[esx\]/esx_blackjob/esx_blackjob.sql

	#KIRKS CORRECTIONS TO TABLES
	mysql -u fivem -p$DB_PASSWORD -e "ALTER TABLE essentialmode.users MODIFY COLUMN position VARCHAR(100)"
	mysql -u fivem -p$DB_PASSWORD -e "UPDATE essentialmode.licenses SET label = 'Firearm Permit' WHERE type = 'weapon'"
	mysql -u fivem -p$DB_PASSWORD -e "UPDATE essentialmode.job_grades SET salary = (salary * 25) WHERE job_name <> 'unemployed'"
fi