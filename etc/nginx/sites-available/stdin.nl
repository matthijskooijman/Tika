server {
	listen 80;
	listen [::]:80;

	server_name www.stdin.nl stdin.nl;

	return 301 http://www.stderr.nl;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
