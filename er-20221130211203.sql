CREATE TABLE IF NOT EXISTS `SERVICEREQUEST` (
    `servicerequest_id` NUMBER NOT NULL AUTO_INCREMENT,
    `requesttime` DATETIME,
    `narrative` TEXT,
    `userid` NUMBER,
    `order_id` NUMBER NOT NULL
);

CREATE TABLE IF NOT EXISTS `INCIDENT` (
    `incident_id` NUMBER NOT NULL AUTO_INCREMENT,
    `incidenttime` DATETIME,
    `businessprocess` TEXT,
    `userid` NUMBER,
    `servicerequest_id` NUMBER NOT NULL
);

CREATE TABLE IF NOT EXISTS `STATUS` (
    `status_id` NUMBER NOT NULL AUTO_INCREMENT,
    `statustime` DATETIME,
    `status` ENUM,
    `narrative` TEXT,
    `incident_id` NUMBER NOT NULL,
    `servicerequest_id` NUMBER NOT NULL
);

CREATE TABLE IF NOT EXISTS `CLIENT` (
    `client_id` NUMBER NOT NULL AUTO_INCREMENT,
    `name` TEXT,
    `middlename` TEXT,
    `surname` TEXT,
    `phonenumber` TEXT,
    `email` TEXT,
    `inn` NUMBER,
    `firmname` TEXT
);

CREATE TABLE IF NOT EXISTS `ORDER` (
    `order_id` NUMBER NOT NULL AUTO_INCREMENT,
    `orderdate` DATETIME,
    `code` TEXT,
    `narrative` TEXT,
    `cost` NUMBER,
    `client_id` NUMBER NOT NULL
);

CREATE TABLE IF NOT EXISTS `SERVICE` (
    `service_id` NUMBER NOT NULL AUTO_INCREMENT,
    `code` TEXT,
    `description` TEXT,
    `incident_id` NUMBER NOT NULL
);

CREATE TABLE IF NOT EXISTS `SERVICEGROUP` (
    `servicegroup_id` NUMBER NOT NULL AUTO_INCREMENT,
    `code` TEXT,
    `description` TEXT,
    `groupemail` TEXT,
    `managerid` NUMBER,
    `service_id` NUMBER NOT NULL
);

