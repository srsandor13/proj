
# Develop a database that generates a data model with SQL tables to implement the data model

CREATE TABLE gift (
	ID integer PRIMARY KEY AUTOINCREMENT,
	name varchar
);

CREATE TABLE friend (
        ID INTERGER NOT NULL PRIMARY KEY AUTOINCREMEMENT,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
	relationship varchar
);


CREATE TABLE item (
        item_ID INTERGER NOT NULL PRIMARY KEY AUTOINCREMEMENT,
        item_name VARCHAR(255) NOT NULL,
	friend_id integer
);

CREATE TABLE vendor (
	vendor_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name varchar,
	address varchar,
	number varchar
);


CREATE TABLE money (
	id integer PRIMARY KEY AUTOINCREMENT,
	name varchar,
	type varchar
);


