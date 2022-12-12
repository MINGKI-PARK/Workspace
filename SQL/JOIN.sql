-- 동등 조인

SELECT *
FROM employees A, departments B
WHERE A.department_id = B.department_id;


SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM locations;

-- 테이블 세 개 조인
SELECT A.employee_id, A.department_id, B.department_name, C.location_id, C.city
FROM employees A,
     departments B,
     locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;


SELECT COUNT(*) AS "조인된 건수"
FROM employees A, departments B
WHERE A.department_id = B.department_id;

-- 외부 조인

