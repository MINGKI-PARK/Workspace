SELECT *
FROM reservation;

SELECT *
FROM reservation
WHERE reserv_date < 20171201
ORDER BY reserv_date;


SELECT branch,
       customer_id,
       SUM(visitor_cnt)
FROM reservation
--WHERE ROWNUM 
GROUP BY branch, customer_id
ORDER BY branch DESC, SUM(visitor_cnt);


