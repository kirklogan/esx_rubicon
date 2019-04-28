resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description 'Rubicon Custom Scripts'

ui_page 'html/index.html'

client_scripts {
	'client/tablet.lua',
    'client/client.lua'
} 

server_scripts {
	'server/server.lua'
}

files {
    'html/index.html',
    'html/css/main.css',
	'html/css/spectre.css',
	'html/css/spectre-icons.css',
    'html/js/listener.js'
}