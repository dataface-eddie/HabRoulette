CREATE TABLE habit.dim_habit
(
    id SERIAL PRIMARY KEY,
    habit_name VARCHAR(100),
    habit_description VARCHAR(1000),
    archived BOOL
    )
;
ALTER TABLE habit.dim_habit
ADD CONSTRAINT unique_habit_name_constraint UNIQUE (habit_name);
