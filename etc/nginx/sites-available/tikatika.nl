server {
	listen 80;
	listen [::]:80;

	root /data/www/tika;

	server_name www.tikatika.nl tikatika.nl tika.local;

	# Enable moinmoin on /wiki
	location ~ ^/wiki/moin_static[^/]*/(.*) {
		alias /usr/share/moin/htdocs/$1;
	}
	location ~ ^(/wiki)(/.*)?$ {
		include uwsgi_params;
		uwsgi_param SCRIPT_NAME	$1;
		uwsgi_param PATH_INFO $2;
                uwsgi_pass unix:///var/run/uwsgi/tikatika.nl-moinmoin.socket;
        }
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
