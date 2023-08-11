{{
  config(
    materialized = 'ephemeral',
    )
}}

SELECT
  "CustomerID"
  ,MIN("OrderDate") AS FirstOrderDate
  ,MAX("OrderDate") AS LastOrderDate
FROM {{ ref('raw_SalesOrderHeader') }}
GROUP BY "CustomerID"
