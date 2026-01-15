-- Assign test user to test org (slug='test')
UPDATE users 
SET org_id = (SELECT id FROM organizations WHERE slug = 'test')
WHERE name = 'test user';
