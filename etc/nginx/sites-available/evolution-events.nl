server {
	server_name www.evolution-events.nl evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
	# Allow longer execution for /inschrijvingen
	uwsgi_read_timeout 300;
}

server {
	server_name exit3.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name orga.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	location /private {
		auth_basic "Evolution Events";
		auth_basic_user_file /data/www/evolution-events.nl/admin.htpasswd;
		autoindex on;
	}
	location /private/foto {
		auth_basic "Evolution Events";
		auth_basic_user_file /data/www/evolution-events.nl/admin-and-guest.htpasswd;
		autoindex on;
	}

	# Enable PHP
	include enable-php;
}

server {
	server_name dorestad1493.evolution-events.nl dorestad.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name xenophobia.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

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
	server_name exodus.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

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
	server_name deadfoxjunction.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

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
	server_name raganorck.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name foto.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name hangout.evolution-events.nl henkout.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	location /.well-known/ {
		# Regular handling
	}
	location / {
		return 301 https://plus.google.com/hangouts/_/event/c098h01pseus1le68vkubv34r5k?authuser=0&hl=en;
	}
}

server {
	server_name extraterrestrial.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name files.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

}


server {
	server_name supersecretmissionx.evolution-events.nl ssmx.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name larpsux.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name extinction.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name exit.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name exit2.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name blackbox.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name lextalionis.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

server {
	server_name noxarabica.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

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
	server_name orenda.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

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
	server_name triplex.evolution-events.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/evolution-events.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/evolution-events.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
