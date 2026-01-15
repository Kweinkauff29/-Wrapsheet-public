SELECT 'users' as tbl, COUNT(*) as cnt FROM users
UNION ALL SELECT 'daily_tasks', COUNT(*) FROM daily_tasks
UNION ALL SELECT 'monthly_goals', COUNT(*) FROM monthly_goals
UNION ALL SELECT 'annual_goals', COUNT(*) FROM annual_goals
UNION ALL SELECT 'projects', COUNT(*) FROM projects
UNION ALL SELECT 'pillar_suggestions', COUNT(*) FROM pillar_suggestions;
