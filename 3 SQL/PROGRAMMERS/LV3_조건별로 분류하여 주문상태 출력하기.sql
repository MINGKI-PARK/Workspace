# 조건별로 분류하여 주문상태 출력하기

# 테이블: food_order
SELECT order_id, product_id, DATE_FORMAT(out_date, '%Y-%m-%d') out_date,
CASE
WHEN out_date <= '2022-05-01' THEN '출고완료'
WHEN out_date > '2022-05-01' THEN '출고대기'
ELSE '출고미정' END '출고여부'
FROM food_order