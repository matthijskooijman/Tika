server {
	listen 80;
	listen [::]:80;

	server_name www.ninniach.nl ninniach.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name portfolio.ninniach.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name weblog.ninniach.nl;

	# Enable PHP
	include enable-php;

	# Serve existing files, redirect all else to blosxom
	try_files $uri $uri/ @blosxom;
	rewrite ^/$ @blosxom;

	location @blosxom {
		set $uwsgi_app app-blosxom;
		include uwsgi;
	}
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
