CREATE VIEW habit.v_habit_score
AS
SELECT insert_time::DATE AS report_date
    , SUM(score) AS score
FROM habit.fact_habit_event
GROUP BY insert_time::date
ORDER BY report_date DESC
