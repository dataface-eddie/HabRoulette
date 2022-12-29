CREATE TABLE habit.dim_habit_time_allocation
(
    id INT REFERENCES habit.dim_habit (id),
    habit_name VARCHAR(100),
    minutes_needed INT
    )
