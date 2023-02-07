# 없어진 기록 찾기

# 테이블: animal_ins, animal_outs
SELECT A.animal_id, A.name
FROM animal_outs A LEFT JOIN animal_ins B
ON A.animal_id = B.animal_id
WHERE B.animal_id IS NULL
ORDER BY A.animal_id;