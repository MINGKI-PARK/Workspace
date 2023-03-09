# 카테고리 별 상품 개수 구하기

# 테이블: product
SELECT LEFT(product_code, 2) category, COUNT(product_code)
FROM product
GROUP BY category
ORDER BY category;