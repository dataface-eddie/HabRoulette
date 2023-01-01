CREATE OR REPLACE PROCEDURE gen_habit(minutes_available INT)
LANGUAGE plpgsql
AS $$
BEGIN
--clear the staging table
    TRUNCATE habit.fact_habit_event_stg;
--load the staging table so we can display the randomly chosen habit and the user
--can then decide if they want to complete it
    INSERT INTO habit.fact_habit_event_stg
    SELECT id
        , habit_name
        , minutes_needed
        , score
        , category
        , NOW() AS insert_time
    FROM habit.v_habit_generator
    WHERE minutes_needed <= minutes_available
        AND archived IS FALSE
    ORDER BY RANDOM()
    LIMIT 1;
    
end; $$
