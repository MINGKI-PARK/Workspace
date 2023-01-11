--1. 인구 특징 통계 분석
--분석12 고객의 수, 남녀 숫자, 평균 나이, 평균 거래 기간을 출력

SELECT COUNT(customer_id) 고객수,
       SUM(DECODE(sex_code, 'M', 1, 0)) 남자,
       SUM(DECODE(sex_code, 'F', 1, 0)) 여자,
       ROUND(AVG(MONTHS_BETWEEN(TO_DATE('20171231', 'YYYYMMDD'), TO_DATE(birth, 'YYYYMMDD')) / 12), 1) 평균나이,
       ROUND(AVG(MONTHS_BETWEEN(TO_DATE('20171231', 'YYYYMMDD'), first_reg_date)), 1) 평균거래기간
FROM customer;


SELECT *
FROM customer;