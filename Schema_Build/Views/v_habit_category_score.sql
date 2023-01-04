CREATE VIEW habit.v_habit_category_score
AS
SELECT insert_time::DATE AS report_date
    , category
    , SUM(score) AS score
FROM habit.fact_habit_event
GROUP BY category
    , insert_time::date
ORDER BY report_date DESC
  , category
;
