# 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기

# 테이블: car_rental_company_rental_history
SELECT MONTH(start_date) month, car_id, COUNT(history_id)
FROM car_rental_company_rental_history
WHERE start_date BETWEEN '2022-08-01' AND '2022-10-31'
AND car_id IN (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(car_id) > 4)
GROUP BY MONTH(start_date), car_id
ORDER BY month, car_id DESC