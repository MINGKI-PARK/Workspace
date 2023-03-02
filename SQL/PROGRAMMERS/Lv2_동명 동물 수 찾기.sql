# 동명 동물 수 찾기

# 테이블: animal_ins
SELECT name, COUNT(name)
FROM animal_ins
WHERE name IS NOT NULL
GROUP BY name
HAVING COUNT(name) > 1
ORDER BY name;