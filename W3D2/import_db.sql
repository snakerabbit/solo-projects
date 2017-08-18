CREATE TABLE users {
  id INTEGER PRIMARY KEY
  fname TEXT NOT NULL
  lname TEXT NOT NULL
}

CREATE TABLE questions {
  id INTEGER PRIMARY KEY
  title TEXT NOT NULL
  body TEXT NOT NULL

  FOREIGN KEY (user_id) REFERENCES users(id)
}

CREATE TABLE question_follows {
  id INTEGER PRIMARY KEY

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (questions_id) REFERENCES questions(id)

};

CREATE TABLE replies {
  id INTEGER PRIMARY KEY
  parent_id INTEGER
  body TEXT NOT NULL

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (parent_id) REFERENCES replies(id)

};

CREATE TABLE question_likes {
  id INTEGER PRIMARY KEY

  FOREIGN KEY (questions_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
};

INSERT INTO
  users(fname, lname)
VALUES
  ('John', 'Smith');

INSERT INTO
  users(fname, lname)
VALUES
  ('')
