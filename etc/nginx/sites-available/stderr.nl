server {
	listen 80;
	listen [::]:80;

	server_name www.stderr.nl stderr.nl;

	# Enable PHP
	include enable-php;

	location /static/tmp {
	    autoindex on;
	}
	location /static/grobbebol {
	    autoindex on;
	}

	rewrite ^/$ /Blog/ permanent;
	# Category got renamed
	rewrite ^/Blog/personal($|/.*) /Blog/Personal$1 permanent;

	# Serve existing files, redirect all else to blosxom
	try_files $uri $uri/ @blosxom;
	location @blosxom {
		set $uwsgi_app app-blosxom;
		include uwsgi;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name parts.stderr.nl;

	# Enable PHP
	include enable-php;
}

server {
	listen 80;
	listen [::]:80;

	server_name git.stderr.nl;

	rewrite ^/$ /gitweb redirect;

	# Redirect this url, which was published in my Master's
	# thesis. Use .* instead of λ, since mod_redirect doesn't like
	# the λ for some reason.
	if ($request_uri = "/gitweb?p=matthijs/projects/c%CE%BBash.git") {
		rewrite ^ /gitweb?p=matthijs/master-project/cλash.git permanent;
	}

	location ~ ^(/gitweb)(/.*)?$ {
		set $script_name $1;
		set $path_info $2;
		set $uwsgi_app app-gitweb;
		include uwsgi;
	}

	location /static {
		alias /usr/share/gitweb/static;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name apt.stderr.nl;
	autoindex on;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
