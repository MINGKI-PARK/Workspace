# 고양이와 개는 몇 마리 있을까

# 테이블: animal_ins
SELECT animal_type, COUNT(animal_type)
FROM animal_ins
GROUP BY animal_type
ORDER BY animal_type;