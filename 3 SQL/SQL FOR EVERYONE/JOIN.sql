--동등 조인
SELECT *
FROM employees A, departments B
WHERE A.department_id = B.department_id;


SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM locations;

--예제6-1 테이블 세 개 조인
SELECT A.employee_id, A.department_id, B.department_name, C.location_id, C.city
FROM employees A,
     departments B,
     locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;


SELECT COUNT(*) AS "조인된 건수"
FROM employees A, departments B
WHERE A.department_id = B.department_id;

--외부 조인

--예제 6-2
--SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
SELECT COUNT(*)
FROM employees A, departments B
WHERE A.department_id = B.department_id(+)
ORDER BY A.employee_id
;


--SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
SELECT COUNT(*)
FROM employees A, departments B
WHERE A.department_id(+) = B.department_id
ORDER BY A.employee_id
;


--자체 조인
--예제 6-3
SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
    B.first_name||' '||B.last_name manager_name
FROM employees A, employees B
WHERE A.manager_id = B.employee_id
ORDER BY A.employee_id;