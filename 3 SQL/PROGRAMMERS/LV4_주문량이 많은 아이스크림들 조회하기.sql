#주문량이 많은 아이스크림들 조회하기
#테이블: first_half, july
#7월 총 주문량 + 상반기 아이스크림 총 주문량, 상위 3개의 맛
#flavor
SELECT A.flavor
FROM first_half A INNER JOIN 
(SELECT flavor, SUM(total_order) total
FROM july
GROUP BY flavor) B
ON A.flavor = B.flavor
ORDER BY (A.total_order + B.total) DESC
LIMIT 3;

SELECT A.flavor
FROM first_half A, july B
WHERE A.flavor = B.flavor
GROUP BY A.flavor
ORDER BY SUM(A.total_order) + SUM(B.total_order) DESC
LIMIT 3;