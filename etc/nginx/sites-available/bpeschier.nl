server {
	listen 80;
	listen [::]:80;

	server_name www.bpeschier.nl bpeschier.nl;

	add_header X-Clacks-Overhead "GNU Terry Pratchett";
	return 301 https://$host$request_uri;
}

server {
	listen 80;
	listen [::]:80;

	server_name www.baspeschier.nl baspeschier.nl;
	return 301 http://bpeschier.nl$request_uri;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name www.bpeschier.nl bpeschier.nl;

	location /.well-known/acme-challenge/ {
		alias /data/www/fizzgig.nl/challenges/.well-known/acme-challenge/;
		try_files $uri =404;
	}

	ssl_certificate      /etc/letsencrypt/live/bpeschier.nl/fullchain.pem;
	ssl_certificate_key  /etc/letsencrypt/live/bpeschier.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536001; includeSubdomains";
	add_header X-Xss-Protection "1; mode=block";
	add_header X-Content-Type-Options "nosniff";
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
