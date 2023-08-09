WITH source AS (
  SELECT *

  FROM {{ source('dbo', 'Customer') }}
)

SELECT DISTINCT
  [CustomerID],
  [PersonID],
  [StoreID],
  [TerritoryID],
  [AccountNumber],
  [rowguid],
  [ModifiedDate]
FROM source
