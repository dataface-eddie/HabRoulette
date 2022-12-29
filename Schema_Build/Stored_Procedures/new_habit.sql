CREATE OR REPLACE PROCEDURE new_habit(
    new_habit_name VARCHAR(100)
    , new_habit_description VARCHAR(1000)
    , new_minutes_needed INT
    , new_score INT)
LANGUAGE plpgsql
AS $$
BEGIN
--Load dim_habit
     INSERT INTO habit.dim_habit
    (habit_name, habit_description, archived)
    VALUES
    (new_habit_name, new_habit_description, TRUE)
    ;
-- Load dim_habit_time_allocation
    INSERT INTO habit.dim_habit_time_allocation
    (id, habit_name, minutes_needed)
    SELECT id
        , new_habit_name
        , new_minutes_needed
    FROM habit.dim_habit
    WHERE habit_name = new_habit_name
    ;
--Load dim_habit_score
    INSERT INTO habit.dim_habit_score
    (id, habit_name, score)
      SELECT id
        , new_habit_name
        , new_score
    FROM habit.dim_habit
    WHERE habit_name = new_habit_name
    ;
END;$$
;
