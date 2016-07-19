#MySQL Schema 
DROP TABLE IF EXISTS Gene;
CREATE TABLE Gene (
	ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	Organism_ID integer NOT NULL DEAFULT 0,
	Gene_Name varchar,
	Tissue_ID integer NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS Organism;
CREATE TABLE Organism (
	ID Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	Organism_Name varchar
);

DROP TABLE IF EXISTS Tissue;
CREATE TABLE Tissue (
	ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	Tissue_type varchar

DROP TABLE IF EXISTS mRNA;
CREATE TABLE Sequence (
	ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	Sequence_data text,
	Exp_level integer,
	Start integer
	Stop integer
);

