# 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기

# 테이블: car_rental_company_rental_history
SELECT car_id, IF(MAX(end_date) >= '2022-10-16', '대여중', '대여 가능') availability
FROM car_rental_company_rental_history
WHERE start_date <= '2022-10-16'
GROUP BY car_id
ORDER BY car_id DESC

SELECT car_id, 
MAX(IF('2022-10-16' BETWEEN start_date AND end_date, '대여중', '대여 가능')) availability
FROM car_rental_company_rental_history
GROUP BY car_id
ORDER BY car_id DESC