
mkdir -p /opt/odoo && mkdir -p /opt/odoo/conf
rm -f .env

## .ENV

 (  	echo "\n# Odoo Parameters" ; \
	echo ODOO_PROXY_MODE=true ;  \
	echo "\n# Postgres Parameters" ; \
	echo DB_NAME=odoo ; \
	echo DB_USER=odoo ; \
	echo DB_filter=.* ; \
	echo "\n# P@ssw0rD" ; \
        echo DB_PASSWORD=$(openssl rand -base64 32) ; \
 	echo ODOO_ADMIN_PASS=$(openssl rand -base64 32) ) >> .env

## odoo.conf
(  	echo "[options]" ; \
        echo addons_path = /mnt/extra-addons ;  \
        echo data_dir = /var/lib/odoo ) >> /opt/odoo/conf/odoo.conf
