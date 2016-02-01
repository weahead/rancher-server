#!/bin/bash

# Adapted from:
# http://docs.rancher.com/rancher/installing-rancher/installing-server/#using-an-external-database

mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" << EOF
set @db='${CATTLE_DB_CATTLE_MYSQL_NAME}';
set @usr='${CATTLE_DB_CATTLE_USERNAME}';
set @pw='${CATTLE_DB_CATTLE_PASSWORD}';

SET @query = CONCAT("CREATE DATABASE IF NOT EXISTS ", @db, " COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8'");
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @query = CONCAT("GRANT ALL ON ", @db, ".* TO '", @usr, "'@'%' IDENTIFIED BY '", @pw, "'");
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @query = CONCAT("GRANT ALL ON ", @db, ".* TO '", @usr, "'@'localhost' IDENTIFIED BY '", @pw, "'");
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

FLUSH PRIVILEGES;

EOF
