-- Create test1 organization if not exists
INSERT OR IGNORE INTO organizations (name, slug, primary_color, secondary_color, created_at, updated_at) 
VALUES ('Test Organization 1', 'test1', '#03aae1', '#fbbf24', datetime('now'), datetime('now'));

-- Create test user for test1 org if not exists
INSERT OR IGNORE INTO users (name, email, role, org_id, is_active, updated_at)
SELECT 'Test User', 'test@test1.org', 'staff', id, 1, datetime('now')
FROM organizations WHERE slug = 'test1';
