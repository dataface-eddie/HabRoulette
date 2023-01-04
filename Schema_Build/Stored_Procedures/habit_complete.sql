CREATE OR REPLACE PROCEDURE habit_complete(user_completed BOOL)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO habit.fact_habit_event
    SELECT id
        , habit_name
        , minutes_needed
        , score
        , category
        , user_completed::BOOL AS completed
        , insert_time
    FROM habit.fact_habit_event_stg;
    
    UPDATE habit.fact_habit_event
    SET score = 0
    WHERE completed IS FALSE;

    TRUNCATE habit.fact_habit_event_stg;
END;$$
;

