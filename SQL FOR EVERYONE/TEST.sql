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


--CASE
SELECT employee_id,
       first_name,
       last_name,
       salary,
       CASE
            WHEN salary >= 9000 THEN '상위급여'
            WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
            ELSE '하위급여'
       END 급여등급
FROM employees
WHERE job_id = 'IT_PROG';


--RANK, DENSE_RANK, ROW_NUMBER: 데이터 값에 순위 매기기
SELECT employee_id,
       salary,
       RANK() OVER(ORDER BY salary DESC) RANK_급여,
       DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK_급여,
       ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees;


SELECT *
FROM employees;

SELECT first_name,
       last_name,
       job_id,
       RANK() OVER(PARTITION BY job_id ORDER BY salary DESC) 랭크,
       ROW_NUMBER() OVER(PARTITION BY job_id ORDER BY salary)
FROM employees
ORDER BY job_id;

SELECT *
FROM 
    (
        SELECT first_name,
               last_name,
               job_id,
               RANK() OVER(PARTITION BY job_id ORDER BY salary DESC) 랭크,
               ROW_NUMBER() OVER(PARTITION BY job_id ORDER BY salary) 로우
        FROM employees
        ORDER BY job_id
    )
WHERE 랭크 < 4;


SELECT *
FROM
    (
        SELECT employee_id,
               RANK() OVER(PARTITION BY job_id ORDER BY salary DESC) 랭크
               
        FROM employees
    )
WHERE RN <=3;

SELECT employee_id,
       RANK() OVER(PARTITION BY job_id ORDER BY salary DESC) 랭크
FROM employees;



SELECT job_id,
       last_name,
       salary
FROM 
    (
        SELECT job_id,
               first_name,
               last_name,
               salary,
               RANK() OVER(PARTITION BY job_id ORDER BY salary DESC) 랭크,
               ROW_NUMBER() OVER(PARTITION BY job_id ORDER BY salary) 로우
        FROM employees
        ORDER BY job_id, salary DESC
    )
WHERE 랭크 < 4;


