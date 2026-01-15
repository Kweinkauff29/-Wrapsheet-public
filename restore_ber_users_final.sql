-- Cascade delete task_votes for BER users
DELETE FROM task_votes WHERE user_id IN (SELECT id FROM users WHERE org_id = 1);

-- Now delete the users
DELETE FROM users WHERE org_id = 1;

-- Re-insert authorized Staff users with updated_at
INSERT INTO users (name, email, role, org_id, avatar_url, updated_at) VALUES 
('Kevin', 'kevin@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Kevin&background=random', datetime('now')),
('Erica', 'erica@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Erica&background=random', datetime('now')),
('Jenna', 'jenna@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Jenna&background=random', datetime('now')),
('Katie', 'katie@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Katie&background=random', datetime('now')),
('Meighan', 'meighan@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Meighan&background=random', datetime('now'));
