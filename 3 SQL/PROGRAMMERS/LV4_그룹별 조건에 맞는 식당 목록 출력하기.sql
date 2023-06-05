# 그룹별 조건에 맞는 식당 목록 출력하기

# 테이블: member_profile, rest_reveiw
SELECT B.member_name, A.review_text, DATE_FORMAT(A.review_date, '%Y-%m-%d') review_date
FROM rest_review A LEFT JOIN member_profile B ON A.member_id = B.member_id
WHERE A.member_id = (
                        SELECT member_id
                        FROM rest_review
                        GROUP BY member_id
                        ORDER BY COUNT(review_text) DESC
                        LIMIT 1
                    )
ORDER BY review_date, A.review_text