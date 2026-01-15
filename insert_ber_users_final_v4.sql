-- IDs to delete (Subquery for readability)
-- Note: SQLite doesn't support CTEs in DELETE, so we repeat the subquery.

-- 1. daily_task_subtasks (assigned_to_id)
DELETE FROM daily_task_subtasks WHERE assigned_to_id IN (
    SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 2. task_votes (user_id)
DELETE FROM task_votes WHERE user_id IN (
    SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 3. daily_tasks (created_by_id, assigned_to_id, assigned_by_id)
DELETE FROM daily_tasks WHERE 
    created_by_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    ) OR
    assigned_to_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    ) OR
    assigned_by_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    );

-- 4. projects (created_by_id)
DELETE FROM projects WHERE created_by_id IN (
    SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 5. users (The targets)
DELETE FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan');

-- 6. Insert authorized BER users
INSERT INTO users (name, email, role, org_id, avatar_url, updated_at) VALUES 
('Kevin', 'kevin@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Kevin&background=random', datetime('now')),
('Erica', 'erica@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Erica&background=random', datetime('now')),
('Jenna', 'jenna@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Jenna&background=random', datetime('now')),
('Katie', 'katie@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Katie&background=random', datetime('now')),
('Meighan', 'meighan@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Meighan&background=random', datetime('now'));
