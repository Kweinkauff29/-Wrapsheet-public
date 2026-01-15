-- Create organizations table
CREATE TABLE IF NOT EXISTS organizations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    logo_url TEXT,
    primary_color TEXT DEFAULT '#03aae1',
    secondary_color TEXT DEFAULT '#fbbf24',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert test organization
INSERT OR IGNORE INTO organizations (name, slug, logo_url, primary_color, secondary_color) 
VALUES ('Bonita Estero Realtors', 'ber', NULL, '#03aae1', '#fbbf24');
