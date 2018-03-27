DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
    username VARCHAR(32) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    isActive BOOLEAN NOT NULL DEFAULT TRUE,
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (username)
);

INSERT INTO Users (USERNAME, PASSWORD) VALUES ('test@fake.com', 'test');
INSERT INTO Users (USERNAME, PASSWORD, isAdmin) VALUES ('test2@fake2.com', 'yo', true);