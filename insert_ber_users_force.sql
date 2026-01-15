-- Cascade delete task_votes for users with target emails (Global cleanup)
DELETE FROM task_votes WHERE user_id IN (
    SELECT id FROM users WHERE email IN (
        'kevin@bonitaesterorealtors.com',
        'erica@bonitaesterorealtors.com',
        'jenna@bonitaesterorealtors.com',
        'katie@bonitaesterorealtors.com',
        'meighan@bonitaesterorealtors.com'
    )
);

-- Delete users with colliding emails globally
DELETE FROM users WHERE email IN (
    'kevin@bonitaesterorealtors.com',
    'erica@bonitaesterorealtors.com',
    'jenna@bonitaesterorealtors.com',
    'katie@bonitaesterorealtors.com',
    'meighan@bonitaesterorealtors.com'
);

-- Re-insert authorized Staff users for BER (org_id=1)
INSERT INTO users (name, email, role, org_id, avatar_url, updated_at) VALUES 
('Kevin', 'kevin@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Kevin&background=random', datetime('now')),
('Erica', 'erica@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Erica&background=random', datetime('now')),
('Jenna', 'jenna@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Jenna&background=random', datetime('now')),
('Katie', 'katie@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Katie&background=random', datetime('now')),
('Meighan', 'meighan@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Meighan&background=random', datetime('now'));
