# 저자 별 카테고리 별 매출액 집계하기

# 테이블: book, author, book_sales
SELECT B.author_id, C.author_name, B.category, SUM(A.sales * B.price) total_sales
FROM book_sales A LEFT JOIN book B ON A.book_id = B.book_id
LEFT JOIN author C ON B.author_id = C.author_id
WHERE A.sales_date BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY B.author_id, B.category
ORDER BY B.author_id, B.category DESC