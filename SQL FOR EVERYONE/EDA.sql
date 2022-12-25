SELECT *
FROM all_tables;

SELECT *
FROM tabs;

SELECT * FROM COLS WHERE TABLE_NAME = 'customer';


--특징 통계 값 계산하기
--분석 1 전체 상품의 주문 완료 건, 총 매출, 평균 매출, 최고 매출, 최저 매출을 출력

SELECT COUNT(*) 전체주문건, 
       SUM(B.sales) 총매출, 
       AVG(B.sales) 평균매출, 
       MAX(B.sales) 최고매출, 
       MIN(B.sales) 최저매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no;


--비교 분석: 판매량과 매출액 비교
--분석 2 전체 상품의 총 판매량과 총 매출액, 전용 상품의 판매량과 매출액을 출력

SELECT COUNT(*) 총판매량, 
       SUM(B.sales) 총매출, 
       SUM(DECODE(B.item_id, 'M0001', 1, 0)) 전용상품판매량, 
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출
       
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N';


--그룹화 분석: 상품별 매출 계산 및 순서 정렬
--분석 3 각 상품별 전체 매출액을 내림차순으로 출력

SELECT C.item_id 상품아이디,
       C.product_name 상품이름,
       SUM(B.sales) 상품매출
FROM reservation A, order_info B, item C
WHERE A.reserv_no = B.reserv_no
AND B.item_id = C.item_id
AND A.cancel = 'N'
GROUP BY C.item_id, C.product_name
ORDER BY SUM(B.sales) DESC;


--시계열 분석: 월별 상품 매출 분석
--분석 4 모든 상품의 월별 매출액 출력

SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) SPECIAL_SET,
       SUM(DECODE(B.item_id, 'M0002', B.sales, 0)) PASTA,
       SUM(DECODE(B.item_id, 'M0003', B.sales, 0)) PIZZA,
       SUM(DECODE(B.item_id, 'M0004', B.sales, 0)) SEA_FOOD,
       SUM(DECODE(B.item_id,

FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);




