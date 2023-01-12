SELECT *
FROM reservation;

SELECT *
FROM reservation
WHERE reserv_date < 20171201
ORDER BY reserv_date;


SELECT branch,
       customer_id,
       SUM(visitor_cnt)
FROM reservation
--WHERE ROWNUM 
GROUP BY branch, customer_id
ORDER BY branch DESC, SUM(visitor_cnt);


--HAVING
SELECT job_id 직무, SUM(salary) 직무별총급여, AVG(salary) 직무별평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY 직무별총급여 DESC, 직무별평균급여;


--DECODE
SELECT first_name,
       last_name,
       department_id,
       salary 원래급여,
       DECODE(department_id, 60, salary * 1.1, salary) 조정된급여,
       DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM employees
ORDER BY department_id;