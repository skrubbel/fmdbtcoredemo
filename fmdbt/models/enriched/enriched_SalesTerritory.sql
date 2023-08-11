WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_SalesTerritory') }}
)

SELECT
  "TerritoryID"
  ,"Name"
  ,"CountryRegionCode"
  ,"Group"
  ,"rowguid"
  ,"ModifiedDate"
FROM source
