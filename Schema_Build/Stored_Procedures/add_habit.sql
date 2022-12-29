CREATE OR REPLACE PROCEDURE add_habit(new_habit_name VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO habit.fact_habit_event
(id, habit_name, minutes_needed, score, completed, insert_time)
 SELECT dh.id
        , dh.habit_name
        , dhta.minutes_needed
        , dhs.score
        , TRUE AS completed
        , NOW() AS insert_time
    FROM habit.dim_habit AS dh
    LEFT JOIN habit.dim_habit_time_allocation AS dhta
        ON dh.id = dhta.id
    LEFT JOIN habit.dim_habit_score AS dhs
        ON dh.id = dhs.id
    WHERE dh.habit_name = new_habit_name
    ;
END;$$
;
