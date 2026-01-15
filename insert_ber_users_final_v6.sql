-- IDs to delete (Subquery logic applied repeatedly)

-- 1. user_preferences (user_id)
DELETE FROM user_preferences WHERE user_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 2. weekly_tasks (assigned_to_id, assigned_by_id)
DELETE FROM weekly_tasks WHERE 
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

-- 3. pillar_suggestions (assigned_to_id, created_by_id)
DELETE FROM pillar_suggestions WHERE 
    created_by_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    ) OR
    assigned_to_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    );

-- 4. project_steps (assigned_to_id)
DELETE FROM project_steps WHERE assigned_to_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 5. goal_subtasks (via goal_id/goal_type linked to owner)
DELETE FROM goal_subtasks WHERE 
    (goal_type = 'monthly' AND goal_id IN (SELECT id FROM monthly_goals WHERE owner_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    )))
    OR
    (goal_type = 'annual' AND goal_id IN (SELECT id FROM annual_goals WHERE owner_id IN (
        SELECT id FROM users WHERE 
        email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
        OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
    )));

-- 6. monthly_goals (owner_id)
DELETE FROM monthly_goals WHERE owner_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 7. annual_goals (owner_id)
DELETE FROM annual_goals WHERE owner_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 8. goal_categories (owner_id)
DELETE FROM goal_categories WHERE owner_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 9. task_votes (user_id)
DELETE FROM task_votes WHERE user_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 10. daily_task_subtasks (assigned_to_id)
DELETE FROM daily_task_subtasks WHERE assigned_to_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 11. daily_tasks (created_by_id, assigned_to_id, assigned_by_id)
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

-- 12. projects (created_by_id)
DELETE FROM projects WHERE created_by_id IN (
    SELECT id FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan')
);

-- 13. users (The targets)
DELETE FROM users WHERE 
    email IN ('kevin@bonitaesterorealtors.com', 'erica@bonitaesterorealtors.com', 'jenna@bonitaesterorealtors.com', 'katie@bonitaesterorealtors.com', 'meighan@bonitaesterorealtors.com')
    OR name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan');

-- 14. Insert authorized BER users
INSERT INTO users (name, email, role, org_id, avatar_url, updated_at) VALUES 
('Kevin', 'kevin@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Kevin&background=random', datetime('now')),
('Erica', 'erica@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Erica&background=random', datetime('now')),
('Jenna', 'jenna@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Jenna&background=random', datetime('now')),
('Katie', 'katie@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Katie&background=random', datetime('now')),
('Meighan', 'meighan@bonitaesterorealtors.com', 'staff', 1, 'https://ui-avatars.com/api/?name=Meighan&background=random', datetime('now'));
