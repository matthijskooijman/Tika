server {
	listen 80;
	listen [::]:80;

	server_name www.tikatika.nl tikatika.nl;


	# Enable PHP
	include enable-php;

	# Enable moinmoin on /wiki
	location ~ ^/wiki/moin_static[^/]*/(.*) {
		alias /usr/share/moin/htdocs/$1;
	}
	location ~ ^(/wiki)(/.*)?$ {
		set $uwsgi_app app-tikawiki;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}

	location ~ ^(/maroesja)(/.*)?$ {
		set $uwsgi_app app-maroesja;
		set $script_name $1;
		set $path_info $2;
		include uwsgi;
	}

	# Limit phpmyadmin
	location /phpmyadmin/libraries {
		deny all;
	}
	location /phpmyadmin/setup {
		deny all;
	}

	location ^~ /stats/icon {
		alias /usr/share/awstats/icon;
	}

	location ~ ^(/stats)(/.*)?$ {
		set $script_name $1;
		set $path_info $2;
		set $uwsgi_app app-awstats;
		include uwsgi;
	}

	location ~ ^(/piwik)(/.*)?$ {
		include enable-php;
	}
}

server {
	listen   80;
	listen   [::]:80;
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     ssl/mail.tikatika.nl.crt-chain;
	ssl_certificate_key ssl/mail.tikatika.nl.key;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	server_name mail.tikatika.nl;

	# Force HTTPS for mail.tikatika.nl
	if ($ssl_protocol = "") {
		rewrite ^ https://$server_name$request_uri permanent;
	}

	# Enable PHP
	include enable-php;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
