# 헤비 유저가 소유한 장소

# 테이블: places
SELECT *
FROM places
WHERE host_id IN (
    SELECT host_id
    FROM places
    GROUP BY host_id
    HAVING COUNT(id) > 1)
ORDER BY id