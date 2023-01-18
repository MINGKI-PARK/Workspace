#보호소에서 중성화한 동물
SELECT A.animal_id, A.animal_type, A.name
FROM animal_ins A, animal_outs B
WHERE A.animal_id = B.animal_id
# AND A.sex_upon_intake LIKE 'Intact%'
# AND B.sex_upon_outcome LIKE 'Spayed%'
# OR B.sex_upon_outcome LIKE 'Neutered'
AND A.sex_upon_intake != B.sex_upon_outcome
ORDER BY animal_id;

#식품분류별 가장 비싼 식품의 정보 조회하기
SELECT category, price, product_name
FROM food_product
WHERE (category, price) IN (SELECT category, MAX(price) 
                            FROM food_product 
                            WHERE category IN ('과자', '국', '김치', '식용유')
                            GROUP BY category)
ORDER BY price DESC;

#5월 식품들의 총매출 조회하기
SELECT A.product_id, A.product_name, (A.price * B.amount) total
FROM food_product A, (SELECT product_id, SUM(amount) amount
                      FROM food_order
                      WHERE DATE_FORMAT(produce_date, '%Y-%m') = '2022-05'
                      GROUP BY product_id) B
WHERE A.product_id = B.product_id
ORDER BY total DESC, product_id;

#우유와 요거트가 담긴 장바구니
SELECT cart_id
FROM cart_products
WHERE name = 'Milk'
AND cart_id IN (SELECT cart_id
                FROM cart_products
                WHERE name = 'Yogurt')
GROUP BY cart_id
ORDER BY cart_id;















