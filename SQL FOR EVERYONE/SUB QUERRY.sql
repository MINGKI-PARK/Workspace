--SUB QUERRY


--���� �� ��������
--���� 7-1
SELECT *
FROM employees A

WHERE A.salary = (
                  SELECT salary
                  FROM employees
                  WHERE last_name = 'De Haan'
                  );
                  
--���� �� ��������
--���� 7-2
SELECT *
FROM employees A

WHERE A.salary IN (
                   SELECT MIN(salary) �����޿�
                   FROM employees
                   GROUP BY department_id
                   )
ORDER BY A.salary DESC;                   