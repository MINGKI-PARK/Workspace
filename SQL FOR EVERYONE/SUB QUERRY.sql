--SUB QUERRY


--단일 행 서브쿼리
--예제 7-1
SELECT *
FROM employees A

WHERE A.salary = (
                  SELECT salary
                  FROM employees
                  WHERE last_name = 'De Haan'
                  );
                  
--다중 행 서브쿼리
--예제 7-2
SELECT *
FROM employees A

WHERE A.salary IN (
                   SELECT MIN(salary) 최저급여
                   FROM employees
                   GROUP BY department_id
                   )
ORDER BY A.salary DESC;                   