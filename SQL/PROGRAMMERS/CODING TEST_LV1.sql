
#여러 기준으로 정렬하기
SELECT animal_id, name, datetime
FROM animal_ins
ORDER BY name, datetime DESC;


#상위 n개 레코드
SELECT *
FROM
    (
    SELECT name
    FROM animal_ins
    ORDER BY datetime
    )
WHERE ROWNUM <= 1;

SELECT name
FROM animal_ins
ORDER BY datetime
LIMIT 1;


#어린 동물 찾기
SELECT animal_id, name
FROM animal_ins
WHERE intake_condition != 'Aged'
ORDER BY animal_id;


#아픈 동물 찾기
SELECT animal_id, name
FROM animal_ins
WHERE intake_condition = 'Sick'
ORDER BY animal_id;

#중복 제거하기
SELECT COUNT(DISTINCT(name)) COUNT
FROM animal_ins;

#이름이 있는 동물의 아이디
SELECT animal_id
FROM animal_ins
WHERE name IS NOT NULL;


#동물의 수 구하기
SELECT COUNT(animal_id)
FROM animal_ins;

#최솟값 구하기
SELECT MIN(datetime) 시간
FROM animal_ins;

#동물의 아이디와 이름
SELECT animal_id, name
FROM animal_ins
ORDER BY animal_id;

#역순 정렬하기
SELECT name, datetime
FROM animal_ins
ORDER BY animal_id DESC;

#모든 레코드 조회
SELECT *
FROM animal_ins
ORDER BY animal_id;

#최댓값 구하기
SELECT MAX(datetime) 시간
FROM animal_ins;

#강원도에 위치한 생산공장 목록 출력하기
SELECT factory_id, factory_name, address
FROM food_factory
WHERE address LIKE '강원도%'
ORDER BY factory_id;

#나이 정보가 없는 회원 수 구하기
SELECT COUNT(*) USERS
FROM user_info
WHERE age IS NULL;

#이름이 없는 동물 아이디
SELECT animal_id
FROM animal_ins
WHERE name IS NULL;

#경기도에 위치한 식품창고 목록 출력하기
SELECT warehouse_id, warehouse_name, address, IFNULL(freezer_yn, 'N')
FROM food_warehouse
WHERE address LIKE '경기도%'
ORDER BY warehouse_id;

#조건에 맞는 회원 수 구하기
SELECT COUNT(*)
FROM user_info
WHERE YEAR(joined) = 2021
AND age BETWEEN 20 AND 29;

#가장 비싼 상품 구하기
SELECT MAX(price) MAX_PRICE
FROM product;

#흉부외과 또는 일반외과 의사 목록 출력하기
SELECT dr_name, dr_id, mcdp_cd, DATE_FORMAT(hire_ymd, '%Y-%m-%d') hire_ymd
FROM doctor
WHERE mcdp_cd IN ('CS', 'GS')
ORDER BY hire_ymd DESC, dr_name;

#12세 이하인 여자 환자 목록 출력하기
SELECT pt_name, pt_no, gend_cd, age, IFNULL(tlno, 'NONE') tlno
FROM patient
WHERE gend_cd = 'W'
AND age <= 12
ORDER BY age DESC, pt_name;

#인기있는 아이스크림
SELECT flavor
FROM first_half
ORDER BY total_order DESC, shipment_id;

#과일로 만든 아이스크림 고르기
SELECT A.flavor
FROM first_half A, icecream_info B
WHERE A.flavor = B.flavor
AND A.total_order > 3000
AND B.ingredient_type = 'fruit_based';

#평균 일일 대여 요금 구하기
SELECT ROUND(AVG(daily_fee)) average_fee
FROM car_rental_company_car
WHERE car_type = 'SUV'
GROUP BY CAR_TYPE;

#조건에 맞는 도서 리스트 출력하기
SELECT book_id, DATE_FORMAT(published_date, '%Y-%m-%d')
FROM book
WHERE YEAR(published_date) = 2021
AND category = '인문'
ORDER BY published_date;

#자동차 대여 기록에서 장기/단기 대여 구분하기
-- 코드를 입력하세요
SELECT history_id,
        car_id,
        DATE_FORMAT(start_date, '%Y-%m-%d') start_date,
        DATE_FORMAT(end_date, '%Y-%m-%d') end_date,
        # IF (DATEDIFF(end_date, start_date) >= 30, THEN '장기 대여', ELSE '단기 대여') AS rent_type
        IF (DATEDIFF(end_date, start_date)+1 >= 30, '장기 대여', '단기 대여') RENT_TYPE
FROM car_rental_company_rental_history
WHERE DATE_FORMAT(start_date, '%Y-%m') = '2022-09'
# WHERE start_date >= '2022-09-01'
ORDER BY history_id DESC











