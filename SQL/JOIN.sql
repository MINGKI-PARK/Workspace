-- ���� ����

SELECT *
FROM employees A, departments B
WHERE A.department_id = B.department_id;


SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM locations;

-- ���̺� �� �� ����
SELECT A.employee_id, A.department_id, B.department_name, C.location_id, C.city
FROM employees A,
     departments B,
     locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;


SELECT COUNT(*) AS "���ε� �Ǽ�"
FROM employees A, departments B
WHERE A.department_id = B.department_id;

-- �ܺ� ����

