WITH source AS (
  SELECT 
    *
  FROM {{ ref('raw_Store')}}
)

SELECT DISTINCT
  "BusinessEntityID"
  ,"Name"
  ,"SalesPersonID"
  ,"Demographics"
  ,"rowguid"
  ,"ModifiedDate"
FROM source
