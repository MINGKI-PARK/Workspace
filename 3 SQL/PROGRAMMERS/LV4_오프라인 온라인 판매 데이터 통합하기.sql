#오프라인/온라인 판매 데이터 통합하기

SELECT DATE_FORMAT(A.sales_date, '%Y-%m-%d'), A.product_id, A.user_id, A.sales_amount
FROM
    (
        SELECT * FROM online_sale
        UNION ALL
        SELECT offline_sale_id, null, product_id, sales_amount, sales_date
        FROM offline_sale
    ) A
WHERE sales_date BETWEEN '2022-03-01' AND '2022-03-31'
ORDER BY sales_date, product_id, user_id;