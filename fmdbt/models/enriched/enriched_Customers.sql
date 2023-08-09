WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_Customer') }}
)

SELECT
  source.[CustomerID]
  ,source.[PersonID] 
  ,source.[StoreID]
  ,source.[TerritoryID]
  ,source.[AccountNumber]
  ,source.[rowguid]
  ,source.[ModifiedDate]
  ,fod.[FirstOrderDate]
FROM source
  LEFT JOIN {{ ref('first_order_date_by_customer_id') }} fod
    ON source.[CustomerID] = fod.[CustomerID]
