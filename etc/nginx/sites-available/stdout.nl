server {
	listen 80;
	listen [::]:80;

	server_name www.stdout.nl stdout.nl;

	# Enable PHP
	include enable-php;

	location /static/tmp {
		autoindex on;
	}

	location = / {
	    return 301 http://www.stderr.nl;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name pajadhani.stdout.nl pajadahni.stdout.nl;

	# Enable PHP
	include enable-php;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
