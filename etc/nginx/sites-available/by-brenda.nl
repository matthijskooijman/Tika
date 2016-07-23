server {
	listen 80;
	listen [::]:80;

	server_name www.by-brenda.nl by-brenda.nl;

	# Enable PHP
	include enable-php;


	if (!-e $request_filename) {
		rewrite ^/p2pshop/admin/(.*)$ /p2pshop/admin/index.php break;
		rewrite ^/p2pshop/checkout/?$ /p2pshop/index.php?checkout;
		rewrite ^/p2pshop/about/?$ /p2pshop/index.php?about;
		rewrite ^/p2pshop/terms/?$ /p2pshop/index.php?terms;
		rewrite ^/p2pshop/contact/?$ /p2pshop/index.php?contact;
		rewrite ^/p2pshop/category-(.*)/?$ /p2pshop/index.php?category=$1;
	}
}
# vim: set ts=8 sts=8 sw=8 noexpandtab filetype=conf:
