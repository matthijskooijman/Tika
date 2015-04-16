server {
	listen 80;
	listen [::]:80;

	server_name www.mkit.nl mkit.nl;

	# Enable PHP
	include enable-php;

	location /static/tmp {
		autoindex on;
	}
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
