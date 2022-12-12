--���� ����
SELECT *
FROM employees A, departments B
WHERE A.department_id = B.department_id;


SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM locations;

--����6-1 ���̺� �� �� ����
SELECT A.employee_id, A.department_id, B.department_name, C.location_id, C.city
FROM employees A,
     departments B,
     locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;


SELECT COUNT(*) AS "���ε� �Ǽ�"
FROM employees A, departments B
WHERE A.department_id = B.department_id;

--�ܺ� ����

--���� 6-2
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


--��ü ����
--���� 6-3
SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
    B.first_name||' '||B.last_name manager_name
FROM employees A, employees B
WHERE A.manager_id = B.employee_id
ORDER BY A.employee_id;