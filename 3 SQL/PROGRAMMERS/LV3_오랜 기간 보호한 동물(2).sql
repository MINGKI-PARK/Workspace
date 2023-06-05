# 오랜 기간 보호한 동물(2)

# 테이블: animal_ins, animal_outs

SELECT A.animal_id, A.name
FROM animal_ins A INNER JOIN animal_outs B
ON A.animal_id = B.animal_id
ORDER BY DATEDIFF(B.datetime, A.datetime) DESC
LIMIT 2