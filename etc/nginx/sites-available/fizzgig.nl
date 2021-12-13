server {
	listen 80;
	listen [::]:80;

	server_name fizzgig.nl www.fizzgig.nl;

	location / {
		add_header X-Clacks-Overhead "GNU Terry Pratchett";
		root /data/www/fizzgig.nl/htdocs/;
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

#
# RSS
#

server {
    listen 80;
    listen [::]:80;
    server_name rss.fizzgig.nl;
    return 301 https://$host$request_uri;
}

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

	location /static/ {
		root /data/www/fizzgig.nl/applications/rss/public/static/;
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
# exit
#

server {
    listen 80;
    listen [::]:80;
    server_name exit.fizzgig.nl;
    return 301 https://$host$request_uri;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name exit.fizzgig.nl;

	location /.well-known/acme-challenge/ {
		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
		try_files $uri =404;
	}

	ssl_certificate      /etc/letsencrypt/live/exit.fizzgig.nl/fullchain.pem;
	ssl_certificate_key  /etc/letsencrypt/live/exit.fizzgig.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
	add_header X-Xss-Protection "1; mode=block";
	add_header X-Content-Type-Options "nosniff";
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	location / {
		root /data/www/fizzgig.nl/applications/exit/htdocs/;
	}

}

server {
    listen 80;
    listen [::]:80;
    server_name exit2020.fizzgig.nl;
    return 301 https://$host$request_uri;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name exit2020.fizzgig.nl;

	location /.well-known/acme-challenge/ {
		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
		try_files $uri =404;
	}

	ssl_certificate      /etc/letsencrypt/live/exit2020.fizzgig.nl/fullchain.pem;
	ssl_certificate_key  /etc/letsencrypt/live/exit2020.fizzgig.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
	add_header X-Xss-Protection "1; mode=block";
	add_header X-Content-Type-Options "nosniff";
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	location / {
		root /data/www/fizzgig.nl/applications/exit2020/htdocs/;
	}

	location /wrahwrah {
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
		proxy_redirect off;

		proxy_pass http://localhost:2020/;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
	}

}


# vim: set ts=4 sts=4 sw=4 noexpandtab filetype=conf:
