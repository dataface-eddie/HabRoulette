--Run to generate a random habit to attempt. ##CALL gen_habit(<mintues_available>)
CALL gen_habit();
SELECT *
FROM habit.fact_habit_event_stg;
--Decide if you are going to do it. If you do CALL habit_comp(TRUE). If not CALL habit_comp(FALSE)
CALL habit_comp(TRUE);
--To see all of your HabRoulette history
SELECT *
FROM habit.fact_habit_event

--TODAY'S SCORE
SELECT *
FROM habit.v_habit_score
WHERE report_date = NOW()::DATE
