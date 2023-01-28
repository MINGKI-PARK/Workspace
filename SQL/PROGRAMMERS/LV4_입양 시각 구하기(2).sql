#입양 시각 구하기(2)

# 테이블: animal_outs

# SELECT HOUR(datetime) HOUR, COUNT(*) COUNT
# FROM animal_outs
# GROUP BY HOUR(datetime)
# ORDER BY HOUR

SELECT A.hour, IFNULL(B.count, 0) count
FROM
    (
        WITH RECURSIVE hours (hour) AS
            (
            SELECT 0
            UNION ALL
            SELECT hour + 1 FROM hours WHERE hour < 23
            )
        SELECT *
        FROM hours A
    ) A
LEFT OUTER JOIN
    (
        SELECT HOUR(datetime) hour, COUNT(*) count
        FROM animal_outs
        GROUP BY HOUR(datetime)
    ) B
ON A.hour = B.hour;