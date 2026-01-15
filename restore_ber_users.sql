-- Delete all users for BER (org_id = 1) to clean up merged/duplicate data
DELETE FROM users WHERE org_id = 1;

-- Re-insert authorized Staff users
INSERT INTO users (name, email, role, org_id, avatar_url) VALUES 
('Kevin', 'kevin@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Kevin&background=random'),
('Erica', 'erica@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Erica&background=random'),
('Jenna', 'jenna@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Jenna&background=random'),
('Katie', 'katie@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Katie&background=random'),
('Meighan', 'meighan@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Meighan&background=random');
