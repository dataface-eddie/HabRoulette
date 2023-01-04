CREATE OR REPLACE PROCEDURE update_habit_name(
    old_habit_name VARCHAR(100)
    , new_habit_name VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE habit.dim_habit
SET habit_name = new_habit_name
WHERE habit_name = old_habit_name
;
UPDATE habit.dim_habit_category
SET habit_name = new_habit_name
WHERE habit_name = old_habit_name
;
UPDATE habit.dim_habit_score
SET habit_name = new_habit_name
WHERE habit_name = old_habit_name
;
UPDATE habit.dim_habit_time_allocation
SET habit_name = new_habit_name
WHERE habit_name = old_habit_name
;
END;$$
;
