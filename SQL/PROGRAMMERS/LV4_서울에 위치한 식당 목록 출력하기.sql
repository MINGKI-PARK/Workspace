#서울에 위치한 식당 목록 출력하기
SELECT A.rest_id, A.rest_name, A.food_type, A.favorites, A.address, B.avg_score
FROM 
(SELECT *
FROM rest_info
WHERE address LIKE '서울%') A,

(SELECT rest_id, ROUND(AVG(review_score), 2) avg_score
FROM rest_review
GROUP BY rest_id) B

WHERE A.rest_id = B.rest_id
ORDER BY B.avg_score DESC, A.favorites DESC;

#simple
SELECT A.rest_id, A.rest_name, A.food_type, A.favorites, A.address, ROUND(AVG(B.review_score), 2) score
FROM rest_info A INNER JOIN rest_review B ON A.rest_id = B.rest_id
WHERE A.address LIKE '서울%'
GROUP BY A.rest_id
ORDER BY score DESC, favorites DESC;