server {
	listen 80;
	listen [::]:80;

	server_name www.lakwijk.com lakwijk.com
	index index.php index.html;

	include enable-php;
	root /data/www/lakwijk.com/htdocs/;
}

server {
	listen 80;
	listen [::]:80;

	server_name rotzooi.lakwijk.com;
	root /data/www/lakwijk.com/sub/rotzooi/;
}

server {
	listen 80;
	listen [::]:80;

	server_name kalender.lakwijk.com;
	root /data/www/lakwijk.com/sub/kalender/;
	include enable-php;
}

# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
