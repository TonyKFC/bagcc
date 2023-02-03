fx_version 'cerulean'
lua54 'yes'
game  'gta5'

author 'jeton'

description 'bagcc'
 
client_scripts {
	'client.lua',
	'@es_extended/locale.lua',
}

server_scripts {
	'server.lua',
	'@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua'
}

dependencies {
 
	'ox_lib',
 
}
