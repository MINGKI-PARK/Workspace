# 입양 시각 구하기(1)

# 테이블: animal_outs
SELECT HOUR(datetime), COUNT(animal_id)
FROM animal_outs
WHERE HOUR(datetime) BETWEEN 9 AND 19
GROUP BY HOUR(datetime)
ORDER BY HOUR(datetime);