WITH source AS (
  SELECT
    *
  FROM {{ ref('enriched_Customers') }}
)

SELECT
  [CustomerID]
  ,[PersonID]
  ,[StoreID]
  ,[TerritoryID]
  ,[AccountNumber]
FROM source
