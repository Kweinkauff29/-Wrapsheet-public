-- Assign all existing projects to BER (org_id = 1) since they were created before multi-tenancy
UPDATE projects SET org_id = 1 WHERE org_id IS NULL;
