# 카테고리 별 도서 판매량 집계하기

# 테이블: book, book_sales
SELECT category, SUM(sales) total_sales
FROM
(SELECT book_id, SUM(sales) sales
FROM book_sales
WHERE sales_date BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY book_id) A LEFT JOIN book B ON A.book_id = B.book_id
GROUP BY category
ORDER BY category

SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES
FROM BOOK_SALES S JOIN BOOK B ON S.BOOK_ID = B.BOOK_ID
WHERE SALES_DATE LIKE '2022-01%'
GROUP BY CATEGORY
ORDER BY 1 ASC