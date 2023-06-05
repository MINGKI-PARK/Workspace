# 오랜 기간 보호한 동물(1)

# 테이블: animal_ins, animal_outs
SELECT A.name, A.datetime
FROM animal_ins A LEFT JOIN animal_outs B
ON A.animal_id = B.animal_id
WHERE B.animal_id IS NULL
ORDER BY A.datetime
LIMIT 3;

# JOIN을 사용하지 않은 정답
SELECT NAME, DATETIME FROM ANIMAL_INS
WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID FROM ANIMAL_OUTS)
ORDER BY DATETIME
LIMIT 3;