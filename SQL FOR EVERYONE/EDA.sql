SELECT *
FROM all_tables;

SELECT *
FROM tabs;

SELECT * FROM COLS WHERE TABLE_NAME = 'customer';


--특징 통계 값 계산하기
SELECT COUNT(*) 전체주문건, 
       SUM(B.sales) 총매출, 
       AVG(B.sales) 평균매출, 
       MAX(B.sales) 최고매출, 
       MIN(B.sales) 최저매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no;