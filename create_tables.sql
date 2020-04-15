CREATE TABLE champ (
    champion_name VARCHAR(15) NOT NULL,
    champion_id INT NOT NULL,
    PRIMARY KEY (champion_id)
);
load data local infile './champs.csv'
into table champ
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

CREATE TABLE match_info (
    match_id INT NOT NULL,
    duration INT,
    version VARCHAR(15),
    PRIMARY KEY (match_id)
);
load data local infile './matches.csv'
into table match_info
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

CREATE TABLE participant (
    player_id INT NOT NULL,
    match_id INT NOT NULL,
    player TINYINT,
    champion_id INT NOT NULL,
    ss1 VARCHAR(15),
    ss2 VARCHAR(15),
    position VARCHAR(13) NOT NULL,
    PRIMARY KEY (player_id),
    FOREIGN KEY (match_id)
        REFERENCES match_info (match_id)
);
load data local infile './participants.csv'
into table participant
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

CREATE TABLE teamban (
    match_id INT NOT NULL,
    team CHAR(1) NOT NULL,
    champion_id INT NOT NULL,
    banturn TINYINT NOT NULL,
    PRIMARY KEY (match_id, banturn)
);
load data local infile './teambans.csv'
into table teamban
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

CREATE TABLE stat (
    player_id INT NOT NULL,
    win BOOLEAN,
    item1 SMALLINT,
    item2 SMALLINT,
    item3 SMALLINT,
    item4 SMALLINT,
    item5 SMALLINT,
    item6 SMALLINT,
    kills TINYINT,
    deaths TINYINT,
    assists TINYINT,
    longesttimespentliving SMALLINT,
    doublekills TINYINT,
    triplekills TINYINT,
    quadrakills TINYINT,
    pentakills TINYINT,
    legendarykills TINYINT,
    goldearned MEDIUMINT,
    firstblood BOOLEAN,
    PRIMARY KEY (player_id)
);
load data local infile './stats.csv'
into table stat
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;
