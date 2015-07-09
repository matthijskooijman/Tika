server {
	listen 80;
	listen [::]:80;

	server_name www.evolution-events.nl evolution-events.nl;

	# Enable PHP
	include enable-php;
	# Allow longer execution for /inschrijvingen
	uwsgi_read_timeout 300;
}

server {
	listen 80;
	listen [::]:80;

	server_name exit3.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name orga.evolution-events.nl;

	location /private {
		auth_basic "Evolution Events";
		auth_basic_user_file /data/www/evolution-events.nl/admin.htpasswd;
		autoindex on;
	}

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name dorestad1493.evolution-events.nl dorestad.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name xenophobia.evolution-events.nl;

	# Enable PHP
	include enable-php;

	# Enable moinmoin on /wiki
	rewrite /Site(/.*)? /wipi/Site$1;

	location ~ ^/wipi/static/(.*) {
		alias /data/www/evolution-events.nl/applications/wipi/static/$1;
	}
	location ~ ^(/wipi)(/.*)?$ {
		set $uwsgi_app app-moinmoin;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name exodus.evolution-events.nl;

	# Enable PHP
	include enable-php;

	# Enable moinmoin on /wiki
	rewrite /Site(/.*)? /wipi/Site$1;

	location ~ ^/wipi/static/(.*) {
		alias /data/www/evolution-events.nl/applications/wipi/static/$1;
	}
	location ~ ^(/wipi)(/.*)?$ {
		set $uwsgi_app app-moinmoin;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name deadfoxjunction.evolution-events.nl;

	# Enable PHP
	include enable-php;

	# Enable moinmoin on /wiki
	rewrite /Site(/.*)? /wipi/Site$1;

	location ~ ^/wipi/static/(.*) {
		alias /data/www/evolution-events.nl/applications/wipi/static/$1;
	}
	location ~ ^(/wipi)(/.*)?$ {
		set $uwsgi_app app-moinmoin;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name raganorck.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name foto.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name hangout.evolution-events.nl henkout.evolution-events.nl;
	return 301 https://plus.google.com/hangouts/_/event/c098h01pseus1le68vkubv34r5k?authuser=0&hl=en;
}

server {
	listen 80;
	listen [::]:80;

	server_name extraterrestrial.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name files.evolution-events.nl;
}


server {
	listen 80;
	listen [::]:80;

	server_name supersecretmissionx.evolution-events.nl ssmx.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name larpsux.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name extinction.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name exit.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name exit2.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name blackbox.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name lextalionis.evolution-events.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name noxarabica.evolution-events.nl;

	# Enable PHP
	include enable-php;

	# Enable moinmoin on /wiki
	rewrite /Site(/.*)? /wipi/Site$1;

	location ~ ^/wipi/static/(.*) {
		alias /data/www/evolution-events.nl/applications/wipi/static/$1;
	}
	location ~ ^(/wipi)(/.*)?$ {
		set $uwsgi_app app-moinmoin;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name orenda.evolution-events.nl;

	# Enable PHP
	include enable-php;

	# Enable moinmoin on /wiki
	rewrite /Site(/.*)? /wipi/Site$1;

	location ~ ^/wipi/static/(.*) {
		alias /data/www/evolution-events.nl/applications/wipi/static/$1;
	}
	location ~ ^(/wipi)(/.*)?$ {
		set $uwsgi_app app-moinmoin;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
