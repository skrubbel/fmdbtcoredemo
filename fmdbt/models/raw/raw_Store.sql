WITH source AS (
  SELECT *

  FROM {{ source('dbo', 'Store') }}
)

SELECT DISTINCT
  [BusinessEntityID],
  [Name],
  [SalesPersonID],
  [Demographics],
  [rowguid],
  [ModifiedDate]
FROM source