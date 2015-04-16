server {
	listen 80;
	listen [::]:80;

	server_name www.domarijn.nl domarijn.nl;

	# Enable PHP
	include enable-php;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
