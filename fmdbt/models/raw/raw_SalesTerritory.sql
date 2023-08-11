WITH source AS (
  SELECT 
    *
  FROM {{ source('dbo', 'SalesTerritory') }}
)

SELECT DISTINCT
  "TerritoryID"
  ,"Name"
  ,"CountryRegionCode"
  ,"Group"
  ,"SalesYTD"
  ,"SalesLastYear"
  ,"CostYTD"
  ,"CostLastYear"
  ,"rowguid"
  ,"ModifiedDate"
FROM source
