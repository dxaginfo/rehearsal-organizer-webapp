CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  datetime TIMESTAMP,
  location VARCHAR(200),
  created_by INTEGER REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS event_members (
  event_id INTEGER REFERENCES events(id),
  user_id INTEGER REFERENCES users(id),
  rsvp_status VARCHAR(30),
  attendance BOOLEAN,
  PRIMARY KEY (event_id, user_id)
);

CREATE TABLE IF NOT EXISTS setlists (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  name VARCHAR(100),
  created_by INTEGER REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS setlist_songs (
  setlist_id INTEGER REFERENCES setlists(id),
  song_title VARCHAR(100),
  artist VARCHAR(100),
  order_index INTEGER,
  PRIMARY KEY (setlist_id, order_index)
);

CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER REFERENCES users(id),
  recipient_id INTEGER,
  group_id INTEGER,
  content TEXT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS payments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  event_id INTEGER REFERENCES events(id),
  amount NUMERIC(8,2),
  status VARCHAR(30),
  payment_provider_id VARCHAR(100)
);
