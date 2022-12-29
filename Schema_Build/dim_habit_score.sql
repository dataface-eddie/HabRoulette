CREATE TABLE habit.dim_habit_score
(
    id INT REFERENCES habit.dim_habit (id),
    habit_name VARCHAR(100),
    score INT
    )
