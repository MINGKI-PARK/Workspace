# 대여 기록이 존재하는 자동차 리스트 구하기

# 테이블: car_rental_company_car, car_rental_company_rental_history
SELECT A.car_id
FROM car_rental_company_rental_history A
LEFT JOIN car_rental_company_car B ON A.car_id = B.car_id
WHERE B.car_type = '세단'
AND MONTH(A.start_date) = 10
GROUP BY A.car_id
ORDER BY A.car_id DESC