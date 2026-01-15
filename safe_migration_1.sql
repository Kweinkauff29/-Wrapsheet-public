-- SAFE MIGRATION: Non-destructive changes only
-- Creates organizations table if missing, adds columns, updates existing users

-- 1. Create organizations if not exists
CREATE TABLE IF NOT EXISTS organizations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    logo_url TEXT,
    primary_color TEXT DEFAULT '#03aae1',
    secondary_color TEXT DEFAULT '#fbbf24',
    settings TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert BER organization if not exists
INSERT OR IGNORE INTO organizations (id, name, slug, logo_url, primary_color, secondary_color, created_at, updated_at) 
VALUES (1, 'Bonita-Estero REALTORS', 'ber', NULL, '#03aae1', '#fbbf24', datetime('now'), datetime('now'));
