-- Drop tables to ensure clean schema update
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS organizations;

-- Create organizations table
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

-- Insert test organization
INSERT INTO organizations (name, slug, logo_url, primary_color, secondary_color, created_at, updated_at) 
VALUES ('Bonita Estero Realtors', 'ber', NULL, '#03aae1', '#fbbf24', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    role TEXT DEFAULT 'staff', -- 'admin', 'staff'
    is_active INTEGER DEFAULT 1,
    org_id INTEGER,
    avatar_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (org_id) REFERENCES organizations(id)
);

