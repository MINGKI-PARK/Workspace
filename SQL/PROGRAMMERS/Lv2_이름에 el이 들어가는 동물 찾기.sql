# 이름에 el이 들어가는 동물 찾기

# 테이블: animal_ins
SELECT animal_id, name
FROM animal_ins
WHERE name LIKE '%el%'
AND animal_type = 'Dog'
ORDER BY name