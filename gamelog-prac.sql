-- Create a table called gamelog

CREATE TABLE gamelog (
id integer primary key autoincrement,
user text,
character text,
level integer,
score integer,
timerec integer
);

-- Create a table called highScore

CREATE TABLE highScore (
  id integer primary key autoincrement,
  userId integer,
  highPoints integer
);

-- Add 3 sets of data for gamelog table

INSERT INTO gamelog (
  user, character, level, score, timerec
)
VALUES
  ('RTS', 'Blaze', 3, 4590, 3000),
  ('JLM', 'Blaze', 1, 6890, 2089),
  ('SDP', 'Blaze', 2, 2460, 1900)
;

-- Pull the highScore data from gamelog
SELECT g.user, g.character, g.level, g.timerec, h.high_points
FROM high_score as h
join gamelog as g
on g.id = h.userid
order by h.high_points desc; -- LIMIT 10

-- Create some values
INSERT INTO high_score
(
  userid, high_points
)
VALUES
(2, 6890),
(1, 4590),
(3, 2460);

--How to create a highscore

SELECT h.id, g.user, h.high_points
FROM gamelog as g
join high_score as h
on g.id = h.userid AND g.score = h.high_points
order by h.high_points desc;
