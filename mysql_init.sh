#! /bin/bash


echo "Create database"
mysqld --initialize-insecure --datadir=/var/lib/mysql

echo "Start mysqld"
/usr/sbin/mysqld --pid-file=/var/run/mysqld/mysqld.pid --user=root &

echo "Change initial password"
while :
do
  if [ -e "/var/run/mysqld/mysqld.pid" ]; then
    mysqladmin password otrs-ioa
    if [ $? = 0 ]; then
        break
    fi
    echo "Change password failed. retry"
  fi
  sleep 2
done


echo "[client]" > /root/.my.cnf
echo 'password="otrs-ioa"' >> /root/.my.cnf

echo "Set mysql root password to 'otrs-ioa'"

echo "Create database & user."
echo "create database otrs default character set utf8;" | mysql
echo "grant all on otrs.* to otrs@localhost identified by 'otrs-ioa';" | mysql

echo "Fetch database from github"
curl -o /otrs_vanilla.sql.gz https://raw.githubusercontent.com/ioa-hirami/otrs6_helpdesk_jp/master/otrs_vanilla.sql.gz

echo "Restore otrs database. Wait a moment..."
zcat /otrs_vanilla.sql.gz | mysql otrs
echo "Restore done."

#rm /otrs_vanilla.sql.gz

exit 0
