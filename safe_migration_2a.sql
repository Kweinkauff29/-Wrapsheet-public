-- Step 2: Add columns to users (if not exist) and update org_id
-- Note: SQLite doesn't have IF NOT EXISTS for columns, so these may error if columns exist - that's OK

-- Try to add org_id column (may fail if exists)
ALTER TABLE users ADD COLUMN org_id INTEGER;

-- Try to add updated_at column (may fail if exists)
ALTER TABLE users ADD COLUMN updated_at DATETIME;
