# 중성화 여부 파악하기

# 테이블: animal_ins
SELECT animal_id, name,
IF (sex_upon_intake LIKE 'Intact%', 'X', 'O') 중성화
FROM animal_ins;