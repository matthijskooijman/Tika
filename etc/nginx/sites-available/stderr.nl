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

	# Block Baiduspider and other bots from eating up CPU time
	# through all kinds of -tags pages.  These pages already have
	# noindex tags, but they're still being crawled (mostly by
	# Baidu). At 2015.12.12, a robots.txt entry blocking these was
	# added, but until it is clear that that actually works, this
	# fixes the direct problem. At 2016.03.23 a lot of
	# rel="nofollow" tags have been added and the below block is
	# expanded from just Baiduspider to all bots and spiders.
	#
	# This uses an ugly hack to allow two conditions, taken from
        # http://rosslawley.co.uk/archive/old/2010/01/04/nginx-how-to-multiple-if-statements/
	# Slightly modified to use a block1 variable, since just a block
	# variable didn't seem to work.
	if ($http_user_agent ~* spider) {
		set $block1 Y;
	}
	if ($http_user_agent ~* bot) {
		set $block1 Y;
	}
	if ($args ~ ^-tags=) {
		set $block "${block1}Y";
	}

	if ($block = YY) {
		return 403;
	}
}

server {
	listen 80;
	listen [::]:80;

	server_name parts.stderr.nl;
	root /data/www/$domain/applications/PartKeepr/web;

	try_files $uri /app.php?$args;

	# Satisfy the setup, which checks if the .htaccess file is working
	rewrite ^/setup\/webserver-test$ /setup/tests/webservercheck.json;

	# Enable PHP
	include enable-php;

	# Allow longer time for cache warmup in setup.php
	uwsgi_read_timeout 300;
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
