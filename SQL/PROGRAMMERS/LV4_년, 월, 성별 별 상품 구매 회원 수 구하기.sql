#년, 월, 성별 별 상품 구매 회원 수 구하기
SELECT YEAR(B.sales_date), MONTH(B.sales_date), A.gender, COUNT(DISTINCT B.user_id)
FROM online_sale B INNER JOIN user_info A ON B.user_id = A.user_id
WHERE A.gender IS NOT NULL
GROUP BY YEAR(B.sales_date), MONTH(B.sales_date), A.gender
ORDER BY YEAR(B.sales_date), MONTH(B.sales_date), A.gender