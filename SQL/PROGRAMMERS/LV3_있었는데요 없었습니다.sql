# 있었는데요 없었습니다

# 테이블: animal_ins, animal_outs
SELECT A.animal_id, A.name
FROM animal_ins A INNER JOIN animal_outs B
ON A.animal_id = B.animal_id
# WHERE DATEDIFF(B.datetime, A.datetime) < 0
WHERE A.datetime > B.datetime
ORDER BY A.datetime