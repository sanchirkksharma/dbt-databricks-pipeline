WITH returns AS
(
    SELECT
        sales_id,
        product_sk,
        store_sk,
        refund_amount,
        returned_qty
    FROM
        {{ ref('bronze_returns') }}
),

product AS
(
    SELECT
        product_sk,
        category
    FROM
        {{ ref('bronze_product') }}
),

store AS
(
    SELECT
        store_sk,
        city
    FROM
        {{ ref('bronze_store') }}
),

joined_query_1 AS (
SELECT
    returns.sales_id,
    returns.refund_amount,
    returns.returned_qty,
    product.category,
    store.city
FROM
    returns
JOIN
    product ON returns.product_sk = product.product_sk
JOIN
    store ON returns.store_sk = store.store_sk
)

SELECT 
    category,
    city,
    sum(refund_amount) as total_refunds
FROM joined_query_1
GROUP BY
    category, city
ORDER BY    
    total_refunds DESC