server {
	listen 80;
	listen [::]:80;

	server_name fizzgig.nl www.fizzgig.nl;

	location / {
		add_header X-Clacks-Overhead "GNU Terry Pratchett";
		set $uwsgi_app app-blog;
		include uwsgi;
	}
}
server {
	listen 80;
	listen [::]:80;

	server_name dump.fizzgig.nl;
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	return 301 https://$host$request_uri;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name dump.fizzgig.nl;

	location /.well-known/acme-challenge/ {
		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
		try_files $uri =404;
	}

	ssl_certificate      /etc/letsencrypt/live/dump.fizzgig.nl/fullchain.pem;
	ssl_certificate_key  /etc/letsencrypt/live/dump.fizzgig.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
	add_header X-Xss-Protection "1; mode=block";
	add_header X-Content-Type-Options "nosniff";
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	location / {
		root /data/www/fizzgig.nl/htdocs/dump/;
	}


}


#server {
#    listen 80;
#    listen [::]:80;
#    server_name hemma.fizzgig.nl;
#    return 301 https://$host$request_uri;
#}
#
#upstream hemma {
#	server 127.0.0.1:8765;
#}
#
#
upstream rss {
	server 127.0.0.1:8766;
}

server {
    listen 80;
    listen [::]:80;
    server_name rss.fizzgig.nl;
    return 301 https://$host$request_uri;
}

#server {
#	listen 443 ssl;
#	listen [::]:443 ssl;
#	server_name hemma.fizzgig.nl;
#
#	location /.well-known/acme-challenge/ {
#		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
#		try_files $uri =404;
#	}
#
#	ssl_certificate      /etc/letsencrypt/live/hemma.fizzgig.nl/fullchain.pem;
#	ssl_certificate_key  /etc/letsencrypt/live/hemma.fizzgig.nl/privkey.pem;
#	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
#	add_header X-Xss-Protection "1; mode=block";
#	add_header X-Content-Type-Options "nosniff";
#	add_header X-Clacks-Overhead "GNU Terry Pratchett";
#
#	location / {
#		proxy_set_header X-Real-IP $remote_addr;
#		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#		proxy_set_header Host $http_host;
#		proxy_redirect off;
#
#		proxy_pass http://localhost:8765/;
#	}
#
#
#	location /rt/ {
#		proxy_set_header X-Real-IP $remote_addr;
#		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#		proxy_set_header Host $http_host;
#		proxy_redirect off;
#
#		proxy_pass http://localhost:8765/;
#		proxy_http_version 1.1;
#		proxy_set_header Upgrade $http_upgrade;
#		proxy_set_header Connection "upgrade";
#	}
#
#}

server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name rss.fizzgig.nl;

	location /.well-known/acme-challenge/ {
		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
		try_files $uri =404;
	}

	ssl_certificate      /etc/letsencrypt/live/rss.fizzgig.nl/fullchain.pem;
	ssl_certificate_key  /etc/letsencrypt/live/rss.fizzgig.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
	add_header X-Xss-Protection "1; mode=block";
	add_header X-Content-Type-Options "nosniff";
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	location / {
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
		proxy_redirect off;

		proxy_pass http://localhost:8766/;
	}


	location /rt/ {
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
		proxy_redirect off;

		proxy_pass http://localhost:8766/;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
	}

}

#
# TWITCH
#

upstream twitch {
	server 127.0.0.1:13131;
}

server {
    listen 80;
    listen [::]:80;
    server_name twitch.fizzgig.nl;
    location /.well-known/acme-challenge/ {
		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
		try_files $uri =404;
    }
#    return 301 https://$host$request_uri;
}

#server {
#	listen 443 ssl;
#	listen [::]:443 ssl;
#	server_name hemma.fizzgig.nl;
#
#	location /.well-known/acme-challenge/ {
#		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
#		try_files $uri =404;
#	}
#
#	ssl_certificate      /etc/letsencrypt/live/hemma.fizzgig.nl/fullchain.pem;
#	ssl_certificate_key  /etc/letsencrypt/live/hemma.fizzgig.nl/privkey.pem;
#	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
#	add_header X-Xss-Protection "1; mode=block";
#	add_header X-Content-Type-Options "nosniff";
#	add_header X-Clacks-Overhead "GNU Terry Pratchett";
#
#	location / {
#		proxy_set_header X-Real-IP $remote_addr;
#		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#		proxy_set_header Host $http_host;
#		proxy_redirect off;
#
#		proxy_pass http://localhost:8765/;
#	}
#
#
#	location /rt/ {
#		proxy_set_header X-Real-IP $remote_addr;
#		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#		proxy_set_header Host $http_host;
#		proxy_redirect off;
#
#		proxy_pass http://localhost:8765/;
#		proxy_http_version 1.1;
#		proxy_set_header Upgrade $http_upgrade;
#		proxy_set_header Connection "upgrade";
#	}
#
#}


# vim: set ts=4 sts=4 sw=4 noexpandtab filetype=conf:
