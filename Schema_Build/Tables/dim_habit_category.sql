CREATE TABLE habit.dim_habit_category (
  id INT REFERENCES habit.dim_habit (id),
  habit_name VARCHAR(100),
  category VARCHAR(100)
  )
  
