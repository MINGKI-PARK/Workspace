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
       SUM(DECODE(B.item_id, 'M0005', B.sales, 0)) STEAK,
       SUM(DECODE(B.item_id, 'M0006', B.sales, 0)) SALAD_BAR,
       SUM(DECODE(B.item_id, 'M0007', B.sales, 0)) SALAD,
       SUM(DECODE(B.item_id, 'M0008', B.sales, 0)) SANDWICH,
       SUM(DECODE(B.item_id, 'M0009', B.sales, 0)) WINE,
       SUM(DECODE(B.item_id, 'M0010', B.sales, 0)) JUICE

FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);


--시계열 분석: 월별 매출 분석
--분석 5 월별 총 매출액과 전용 상품 매출액 출력

SELECT SUBSTR(A.reserv_date, 1, 6) 매출액,
       SUM(B.sales) 총매출,
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);


--산술 계산: 매출 기여율 추가
--분석 6 분석5에 매출 기여율 추가. 기여율은 소수점 아래 두 번째 자리에서 반올림.

SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
       SUM(B.sales) - SUM(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출,
       SUM(decode(B.item_id, 'M0001', B.sales,0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0))/SUM(B.sales)*100, 1) 매출기여율
       
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);


--외부 조인: 부족한 데이터 처리
--분석 7 분석 6에 총 예약 건수, 예약 취소 건수를 추가해 보세요.

SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
       SUM(B.sales) 총매출,
       SUM(B.sales) - SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출,
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0))/SUM(B.sales)*100, 1) 매출기여율,
       COUNT(A.reserv_no) 총예약건,
       SUM(DECODE(A.cancel, 'N', 1, 0)) 예약완료건,
       SUM(DECODE(A.cancel, 'Y', 1, 0)) 예약취소건
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
--AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);


SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
       SUM(B.sales) 총매출,
       SUM(B.sales) - SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출,
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0))/SUM(B.sales)*100, 1) 매출기여율,
       COUNT(A.reserv_no) 총예약건,
       SUM(DECODE(A.cancel, 'N', 1, 0)) 예약완료건,
       SUM(DECODE(A.cancel, 'Y', 1, 0)) 예약취소건
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no(+)
--AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);


--데이터 처리: 날짜 가공하기, 문자 붙이기
--분석 8 분석7에 총 매출 대비 전용 상품의 판매율, 총 예약 건 대비 예약 취소율을 추가. 소수점이 나올 경우 소수점 아래 두 번째에서 반올림하여 출력.

SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
       SUM(B.sales) 총매출,
       SUM(B.sales) - SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출,
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) / SUM(B.sales) * 100, 1)||'%' 전용상품판매율,
       
       COUNT(A.reserv_no) 총예약건,
       SUM(DECODE(A.cancel, 'N', 1, 0)) 예약완료건,
       SUM(DECODE(A.cancel, 'Y', 1, 0)) 예약취소건,
       ROUND(SUM(DECODE(A.cancel, 'Y', 1, 0)) / COUNT(A.reserv_no) * 100, 1)||'%' 예약취소율
       
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no(+)
--AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);


--요일별 매출 분석: 날짜 처리하기
--분석9 월별 전용 상품 매출액을 일요일부터 월요일까지 구분해 출력

SELECT SUBSTR(reserv_date, 1, 6) 날짜,
       A.product_name 상품명,
       SUM(DECODE(A.WEEK, '1', A.sales, 0)) 일요일,
       SUM(DECODE(A.WEEK, '2', A.sales, 0)) 월요일,
       SUM(DECODE(A.WEEK, '3', A.sales, 0)) 화요일,
       SUM(DECODE(A.WEEK, '4', A.sales, 0)) 수요일,
       SUM(DECODE(A.WEEK, '5', A.sales, 0)) 목요일,
       SUM(DECODE(A.WEEK, '6', A.sales, 0)) 금요일,
       SUM(DECODE(A.WEEK, '7', A.sales, 0)) 토요일
       
FROM
    (
    SELECT A.reserv_date,
           C.product_name,
           TO_CHAR(TO_DATE(A.reserv_date, 'YYYYMMDD') , 'd') WEEK,
           B.sales
    FROM reservation A, order_info B, item C
    WHERE A.reserv_no = B.reserv_no
    AND B.item_id = C.item_id
    AND B.item_id = 'M0001'
    ) A
GROUP BY SUBSTR(reserv_date, 1, 6), A.product_name
ORDER BY SUBSTR(reserv_date, 1, 6);


--순위 분석: 월별 전용 상품 최대 실적 지점 확인하기
--분석10 월별 전용 상품 매출 1위부터 3위까지 지점이 어디인지 확인

SELECT  * 
FROM (
        SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
               A.branch 지점,
               SUM(B.sales) 전용상품매출,
               RANK() OVER(PARTITION BY SUBSTR(A.reserv_date, 1, 6) ORDER BY SUM(B.sales) DESC) 지점순위
        FROM reservation A, order_info B
        WHERE A.reserv_no = B.reserv_no
        AND A.cancel = 'N'
        AND B.item_id = 'M0001'
        GROUP BY SUBSTR(A.reserv_date, 1, 6), A.branch
        ORDER BY SUBSTR(A.reserv_date, 1, 6)
     ) A
WHERE A.지점순위 <= 3;


--1위 지점만 다시 조회

SELECT *
FROM (
        SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
               A.branch 지점,
               SUM(B.sales) 전용상품매출,
               ROW_NUMBER() OVER(PARTITION BY SUBSTR(A.reserv_date, 1, 6) ORDER BY SUM(B.sales) DESC) 지점순위,
               DECODE(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B') 지점등급
        FROM reservation A, order_info B
        WHERE A.reserv_no = B.reserv_no
        AND A.cancel = 'N'
        AND B.item_id = 'M0001'
        GROUP BY SUBSTR(A.reserv_date, 1, 6), A.branch, DECODE(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B')
        ORDER BY SUBSTR(A.reserv_date, 1, 6)
     ) A
WHERE A.지점순위 = 1;
--AND 지점등급 = 'A';


--종합 리포트 만들기
--분석11 분석8의 결과와 분석10의 결과 항목을 월별로 합쳐서 리포트 만들기

SELECT A.매출월 매출월,
       MAX(총매출) 총매출,
       MAX(전용상품외매출) 전용상품외매출,
       MAX(전용상품매출) 전용상품매출,
       MAX(전용상품판매율) 전용상품판매율,
       MAX(총예약건) 총예약건,
       MAX(예약완료건) 예약완료건,
       MAX(예약취소건) 예약취소건,
       MAX(예약취소율) 예약취소율,
       MAX(최대매출지점) 최대매출지점,
       MAX(지점매출액) 지점매출액
FROM(
        SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
               SUM(B.sales) 총매출,
               SUM(B.sales) - SUM(DECODE(B.item_id, 'M0001' B.sales, 0)) 전용상품외매출,
               SUM(DECODE(B.item_id, 'M0001' B.sales, 0)) 전용상품매출,
               ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) / SUM(B.sales) * 100, 1) || '%' 전용상품판매율,
               COUNT(A.reserv_no) 총예약건,
               SUM(DECODE(A.cancel, 'N', 1, 0)) 예약완료건,
               
