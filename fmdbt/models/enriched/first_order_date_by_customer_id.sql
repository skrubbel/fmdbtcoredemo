{{
  config(
    materialized = 'ephemeral',
    )
}}

SELECT
  CustomerID
  ,MIN(OrderDate) AS FirstOrderDate
FROM {{ ref('enriched_SalesTransactions') }}
GROUP BY CustomerID
