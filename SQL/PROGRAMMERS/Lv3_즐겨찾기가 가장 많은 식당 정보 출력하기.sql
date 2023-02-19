# 즐겨찾기가 가장 많은 식당 정보 출력하기

# 테이블: rest_info
SELECT food_type, rest_id, rest_name, favorites
FROM rest_info
WHERE favorites IN (
                    SELECT MAX(favorites)
                    FROM rest_info
                    GROUP BY food_type)
GROUP BY food_type
ORDER BY food_type DESC