{{
  config(
    materialized = 'ephemeral',
    )
}}

SELECT
  "SalesOrderID"
  ,COUNT("SalesOrderDetailID") AS SalesOrderDetailLineCount
FROM {{ ref('raw_SalesOrderDetail') }}
GROUP BY "SalesOrderID"
