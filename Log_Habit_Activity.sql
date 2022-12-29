--if you need to search the name of the habit
SELECT *
FROM habit.dim_habit
WHERE habit_name ILIKE ''-- narrow the list here
;
--Then copy and paste the habit_name you did into the call statement
CALL add_habit('Habit_Name')
