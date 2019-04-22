resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description 'Rubicon Custom Scripts'

ui_page 'html/index.html'

client_scripts {
    'client/client.lua',
    'client/killingerr-test.lua'
} 

server_scripts {
	'server/server.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js'
}