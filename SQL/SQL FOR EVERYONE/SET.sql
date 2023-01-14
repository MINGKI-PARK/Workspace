--���� ������

--UNION
--���� 6-4
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;
--�ߺ��� ���� ����
--�ڵ����� ����


--UNION ALL
--���� 6-5
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments
ORDER BY department_id;
--���ĵ��� ����


--INTERSECT
--���� 6-6
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments
ORDER BY department_id;


--MINUS
--���� 6-7
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;