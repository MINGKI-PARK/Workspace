# 가격이 제일 비싼 식품의 정보 출력하기

# 테이블: food_product
SELECT *
FROM food_product
WHERE price = (
    SELECT MAX(price)
    FROM food_product)
    
SELECT *
FROM food_product
ORDER BY price DESC # 가격 내림차순 
LIMIT 1 # 하나의 행만 