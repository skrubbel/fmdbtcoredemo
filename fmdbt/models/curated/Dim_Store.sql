WITH source AS (
  SELECT 
    *
  FROM {{ ref('enriched_Store')}}
)

SELECT DISTINCT
  "BusinessEntityID"
  ,"Name"
  ,"SalesPersonID"
  ,"Demographics"
  ,"rowguid"
  ,"ModifiedDate"
FROM source