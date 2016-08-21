CREATE TABLE seq (
        id integer PRIMARY KEY AUTOINCREMENT,
        accession varchar,
        id varchar,
        description varchar,
        name varchar,
        seq varchar,
        );

CREATE TABLE blast (
        id integer PRIMARY KEY AUTOINCREMENT,
        find_id integer,
        final_id integer
);
