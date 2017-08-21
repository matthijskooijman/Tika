server {
	server_name www.domarijn.nl domarijn.nl;

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate     /etc/letsencrypt/live/domarijn.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/domarijn.nl/privkey.pem;
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	# Enable PHP
	include enable-php;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
