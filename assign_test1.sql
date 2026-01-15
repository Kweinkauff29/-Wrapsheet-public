-- Assign test user to test1 org (slug='test1')
UPDATE users 
SET org_id = (SELECT id FROM organizations WHERE slug = 'test1')
WHERE name = 'test user';
