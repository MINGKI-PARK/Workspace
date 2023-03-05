# DATETIME에서 DATE로 형 변환

# 테이블: animal_ins
SELECT animal_id, name, DATE_FORMAT(datetime, '%Y-%m-%d')
FROM animal_ins;