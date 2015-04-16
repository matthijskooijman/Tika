server {
	listen 80;
	listen [::]:80;

	server_name fizzgig.nl www.fizzgig.nl;

	location / {
		add_header X-Clacks-Overhead "GNU Terry Pratchett";
		set $uwsgi_app app-blog;
		include uwsgi;
	}
}
server {
	listen 80;
	listen [::]:80;

	server_name dump.fizzgig.nl;
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	root /data/www/fizzgig.nl/htdocs/dump/;
}

server {
	listen 80;
	listen [::]:80;

	server_name hemma.fizzgig.nl;

	root /data/www/fizzgig.nl/htdocs/hemma/;
	add_header X-Clacks-Overhead "GNU Terry Pratchett";

	index index.html;
}


# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
