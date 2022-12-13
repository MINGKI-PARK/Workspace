--집합 연산자

--UNION
--예제 6-4
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;
--중복된 값이 없음
--자동으로 정렬


--UNION ALL
--예제 6-5
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments
ORDER BY department_id;
--정렬되지 않음


--INTERSECT
--예제 6-6
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments
ORDER BY department_id;


--MINUS
--예제 6-7
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;