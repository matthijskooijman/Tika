server {
	server_name www.mkit.nl mkit.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/mkit.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/mkit.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;

	location /static/tmp {
		autoindex on;
	}
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
