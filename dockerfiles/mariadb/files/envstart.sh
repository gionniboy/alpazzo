#!/bin/sh
# $Id: envstart.sh,v 0.4 2018/04/28 $ $Author: GB 'gionniboy' Pullarà <info@firegarden.co> $
# $Id: envstart.sh,v 0.4 2018/04/28 $ $Author: Filippo 'joeyrs' Civiletti <fc@xafe.it> $

# bootstrap database container

# Init datadir if not exists.
function db_init {
   if [ -z "$(ls -A ${1})" ] ; then
      /usr/bin/mysql_install_db --user=mysql --datadir=${1} &> /var/log/mysql_install_db.log
      db_grants
   fi
}

# Insert bind-address directive if not present.
function db_bind {
   if ! $(grep -q "bind-address" ${1}) ; then
      sed -i '/\[mysqld\]/a bind-address = 127.0.0.1' ${1}
   fi
}

# Create a SQL-Scripts file for grants.
function db_grants {
   echo "USE mysql;" > /tmp/sqlgrants.sql
   echo "FLUSH PRIVILEGES;" >> /tmp/sqlgrants.sql
   echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by '${DB_ROOTPASS}' WITH GRANT OPTION;" >> /tmp/sqlgrants.sql
   echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by '${DB_ROOTPASS}' WITH GRANT OPTION;" >> /tmp/sqlgrants.sql
   echo "UPDATE user SET password=PASSWORD("") WHERE user='root' AND host='localhost';" >> /tmp/sqlgrants.sql
   /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < /tmp/sqlgrants.sql
   #/bin/rm /tmp/sqlgrants.sql
}

function db_start {        # Starts MySQL/MariaDB.
   exec /usr/bin/mysqld_safe --datadir=${1}
}

# ----------------------------------------------------------------------
# Main.
# ----------------------------------------------------------------------
db_init ${DB_DATAPATH}
db_bind ${DB_CONFIGFILE}
db_start ${DB_DATAPATH}
