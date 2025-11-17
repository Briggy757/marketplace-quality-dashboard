--------------------------------------------------------------
-- 1. Taux d’anomalies par 100 tests exécutés, par mois
--------------------------------------------------------------

WITH tests_per_month AS (
    SELECT
        DATE_TRUNC('month', run_date) AS month,
        SUM(total_tests) AS total_tests
    FROM test_runs
    WHERE environment = 'RECETTE'
    GROUP BY DATE_TRUNC('month', run_date)
),
bugs_per_month AS (
    SELECT
        DATE_TRUNC('month', created_at) AS month,
        COUNT(id) AS bugs_count
    FROM bugs
    WHERE detected_in_env = 'RECETTE'
    GROUP BY DATE_TRUNC('month', created_at)
)
SELECT
    t.month,
    t.total_tests,
    COALESCE(b.bugs_count, 0) AS bugs_count,
    CASE
        WHEN t.total_tests = 0 THEN 0
        ELSE ROUND((COALESCE(b.bugs_count, 0) * 100.0) / t.total_tests, 2)
    END AS bugs_per_100_tests
FROM tests_per_month t
LEFT JOIN bugs_per_month b ON b.month = t.month
ORDER BY t.month;

--------------------------------------------------------------
-- 2. Nombre d’anomalies ouvertes par sévérité
--------------------------------------------------------------

SELECT
    severity,
    COUNT(*) AS open_bugs
FROM bugs
WHERE status IN ('OPEN', 'IN_PROGRESS', 'REOPENED')
GROUP BY severity
ORDER BY
    CASE severity
        WHEN 'BLOCKER' THEN 1
        WHEN 'CRITICAL' THEN 2
        WHEN 'MAJOR' THEN 3
        WHEN 'MINOR' THEN 4
        ELSE 5
    END;

--------------------------------------------------------------
-- 3. Temps moyen de résolution (MTTR) en jours
--------------------------------------------------------------

SELECT
    severity,
    ROUND(AVG(EXTRACT(EPOCH FROM (fixed_at - created_at)) / 86400), 2) AS mttr_days
FROM bugs
WHERE
    status = 'CLOSED'
    AND fixed_at IS NOT NULL
GROUP BY severity
ORDER BY
    CASE severity
        WHEN 'BLOCKER' THEN 1
        WHEN 'CRITICAL' THEN 2
        WHEN 'MAJOR' THEN 3
        WHEN 'MINOR' THEN 4
        ELSE 5
    END;

--------------------------------------------------------------
-- 4. Taux de réouverture global
--------------------------------------------------------------

-- On suppose qu’un bug réouvert a le statut 'REOPENED' dans l’historique,
-- ou un flag spécifique. Ici on simplifie avec un champ boolean 'is_reopened'.

SELECT
    ROUND(
        (SUM(CASE WHEN is_reopened THEN 1 ELSE 0 END) * 100.0)
        / COUNT(*),
        2
    ) AS reopen_rate_percent
FROM bugs;
