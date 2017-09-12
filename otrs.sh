#! /bin/bash

rm /var/run/httpd/httpd.pid
rm /var/run/dovecot/master.pid
rm /var/run/mysqld/mysqld.pid
rm /var/lib/mysql/mysql.sock.lock

/usr/bin/newaliases
/usr/sbin/postfix start

echo -e "Starting Cron"
/opt/otrs/bin/Cron.sh start otrs

echo -e "Starting supervisord.."
/bin/supervisord -c /etc/supervisord.conf
