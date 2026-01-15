-- FIX: Proper org assignment
-- Step 1: Reset ALL users to NULL org_id
UPDATE users SET org_id = NULL;

-- Step 2: Assign ONLY the 5 BER staff to org_id = 1
UPDATE users SET org_id = 1 WHERE name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan');

-- Step 3: Set all BER staff to role = 'staff' (ensures filter works)
UPDATE users SET role = 'staff' WHERE name IN ('Kevin', 'Erica', 'Jenna', 'Katie', 'Meighan');
