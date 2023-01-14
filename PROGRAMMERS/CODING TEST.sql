--1
--여러 기준으로 정렬하기

SELECT animal_id, name, datetime
FROM animal_ins
ORDER BY name, datetime DESC;


--2
--상위 n개 레코드
--oracle
SELECT *
FROM
    (
    SELECT name
    FROM animal_ins
    ORDER BY datetime
    )
WHERE ROWNUM <= 1;

--mysql
SELECT name
FROM animal_ins
ORDER BY datetime
LIMIT 1;


--3
--어린 동물 찾기
SELECT animal_id, name
FROM animal_ins
WHERE intake_condition != 'Aged'
ORDER BY animal_id;


--4
--아픈 동물 찾기
SELECT animal_id, name
FROM animal_ins
WHERE intake_condition = 'Sick'
ORDER BY animal_id;


--5
--중복 제거하기
SELECT COUNT(DISTINCT(name)) COUNT
FROM animal_ins;











