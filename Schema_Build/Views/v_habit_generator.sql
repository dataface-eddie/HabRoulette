CREATE OR REPLACE VIEW habit.v_habit_generator
AS
SELECT dh.id
    , dh.habit_name
    , dhta.minutes_needed
    , dhs.score
    , category
FROM habit.dim_habit AS dh
JOIN habit.dim_habit_time_allocation AS dhta
    ON dh.id = dhta.id
LEFT JOIN habit.dim_habit_score AS dhs
    ON dh.id = dhs.id
LEFT JOIN habit.dim_habit_category AS dhc
    ON dh.id = dhc.id
WHERE archived IS FALSE
;
