-- Step 2b: Update all users to belong to BER organization (org_id = 1)
-- This preserves all user data and just assigns them to the org
UPDATE users SET org_id = 1 WHERE org_id IS NULL;

-- Update timestamps
UPDATE users SET updated_at = datetime('now') WHERE updated_at IS NULL;
