ALTER TABLE users ADD COLUMN updated_at DATETIME;
UPDATE users SET updated_at = datetime('now') WHERE updated_at IS NULL;
