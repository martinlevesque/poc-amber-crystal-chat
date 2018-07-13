-- +micrate Up
CREATE TABLE messages (
  id INTEGER NOT NULL PRIMARY KEY,
  username VARCHAR,
  channel VARCHAR,
  message VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS messages;
