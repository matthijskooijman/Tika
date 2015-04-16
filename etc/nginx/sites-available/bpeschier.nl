server {
	listen 80;
	listen [::]:80;

	server_name www.bpeschier.nl bpeschier.nl;

	add_header X-Clacks-Overhead "GNU Terry Pratchett";
}

server {
	listen 80;
	listen [::]:80;

	server_name www.baspeschier.nl baspeschier.nl;
	return 301 http://bpeschier.nl$request_uri;
}

server {
	listen 80;
	listen [::]:80;

	server_name funder.bpeschier.nl;

	location / {
		add_header X-Clacks-Overhead "GNU Terry Pratchett";
		set $uwsgi_app app-funder;
		include uwsgi;
        }
}
# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
