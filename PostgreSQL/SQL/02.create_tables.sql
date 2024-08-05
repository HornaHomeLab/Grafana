CREATE TABLE Actions(
    ID serial PRIMARY KEY NOT NULL,
    Name varchar UNIQUE NOT NULL,
    Endpoint_url varchar NOT NULL
);

CREATE TABLE Operations(
    ID serial PRIMARY KEY NOT NULL,
    Start_time timestamp NOT NULL,
    End_time timestamp NULL,
    Action_ID int NOT NULL,
    Action_Status JSON NULL
);

ALTER TABLE Operations
ADD CONSTRAINT Action_ID_fkey FOREIGN KEY (Action_ID) 
REFERENCES Actions (ID) MATCH SIMPLE;