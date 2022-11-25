DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS beer;
DROP TABLE IF EXISTS pub;
DROP TABLE IF EXISTS treaty_city;
DROP TABLE IF EXISTS sextons;
DROP TABLE IF EXISTS the_commercial;
DROP TABLE IF EXISTS crew;
DROP TABLE IF EXISTS the_white_house;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

CREATE TABLE beer (
  beer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  beer_name TEXT NOT NULL,
  beer_description TEXT NOT NULL
);

CREATE TABLE pub (
  pub_id INTEGER PRIMARY KEY AUTOINCREMENT,
  pub_name TEXT NOT NULL,
  location TEXT NOT NULL,
  pub_description TEXT NOT NULL
);

CREATE TABLE treaty_city (
  pub_id INTEGER NOT NULL,
  beer_id INTEGER NOT NULL,
  beer_name TEXT NOT NULL,
  FOREIGN KEY (pub_id) REFERENCES pub (pub_id),
  FOREIGN KEY (beer_id) REFERENCES beer (beer_id)
);

CREATE TABLE sextons (
  pub_id INTEGER NOT NULL,
  beer_id INTEGER NOT NULL,
  beer_name TEXT NOT NULL,
  FOREIGN KEY (pub_id) REFERENCES pub (pub_id),
  FOREIGN KEY (beer_id) REFERENCES beer (beer_id)
);

CREATE TABLE the_commercial (
  pub_id INTEGER NOT NULL,
  beer_id INTEGER NOT NULL,
  beer_name TEXT NOT NULL,
  FOREIGN KEY (pub_id) REFERENCES pub (pub_id),
  FOREIGN KEY (beer_id) REFERENCES beer (beer_id)
);

CREATE TABLE crew (
  pub_id INTEGER NOT NULL,
  beer_id INTEGER NOT NULL,
  beer_name TEXT NOT NULL,
  FOREIGN KEY (pub_id) REFERENCES pub (pub_id),
  FOREIGN KEY (beer_id) REFERENCES beer (beer_id)
);

CREATE TABLE the_white_house (
  pub_id INTEGER NOT NULL,
  beer_id INTEGER NOT NULL,
  beer_name TEXT NOT NULL,
  FOREIGN KEY (pub_id) REFERENCES pub (pub_id),
  FOREIGN KEY (beer_id) REFERENCES beer (beer_id)
);

INSERT INTO beer (beer_name, beer_description)
VALUES ('Ecstatic citrus','Malty & Sweet, 5% alcohol'),
       ('Dark Drizzle','Dark & Roasty, 4.5% alcohol'),
       ('Curious Drop','Sour, Tart, & Funky, 3.5% alcohol'),
       ('Mosaic Dry Hopped','Hoppy & Bitter, 5.5% alcohol'),
       ('Double Foggy','Smokey, 4.75% alcohol'),
       ('Enchanted Hallucination','Crisp & Clean, 3.5% alcohol'),
       ('Lucid Daydream','Fruit & Spice, 5% alcohol'),
       ('Murk Wisp','Light, delicate, crisp and refreshing., 5% alcohol');

INSERT INTO pub (pub_name, location, pub_description )
VALUES ('Treaty City','Medieval Quarter, 24 & 25 Nicholas St, Limerick, V94 EH57','Houses a large selection of ales to choose from, Cozy and warm'),
       ('Sextons',' 91 Henry St, Limerick, V94 CA29',' Large open space with outdoor pizza oven'),
       ('The Commercial','46-47 Catherine St, Limerick, V94 T2V3','Retro bar, previously a Hotel'),
       ('Crew Brewery','35 Thomas St, Limerick, V94 A5X4', 'Locally produces craft beers on site'),
       ('The White House','52 O,Connell St, Limerick, V94 NYH9','Traditional music played regularly');



