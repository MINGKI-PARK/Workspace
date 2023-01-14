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


--다중 열 서브쿼리
--예제 7-3

SELECT *
FROM employees A
WHERE (A.job_id, A.salary) IN (
                                SELECT job_id, MIN(salary) 그룹별급여
                                FROM employees
                                GROUP BY job_id
                                )
ORDER BY A.salary DESC;


--FROM 절 서브쿼리
--예제 7-4

SELECT *
FROM employees A,
                ( 
                SELECT department_id
                FROM departments
                WHERE department_name = 'IT'
                ) B
WHERE A.department_id = B.department_id;           