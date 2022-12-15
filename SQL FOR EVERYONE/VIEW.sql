--뷰: 가상의 테이블

--예제 11-1

SELECT A.employee_id, A.hire_date, B.department_name, B.job_title
FROM employees A, emp_details_view B
WHERE A.employee_id = B.employee_id
AND A.employee_id = 100;