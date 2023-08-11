WITH source AS (
  SELECT
    *
  FROM {{ ref('enriched_SalesTerritory') }}
)

SELECT
  "TerritoryID"
  ,"Name"
  ,"CountryRegionCode"
  ,"Group"
  ,"rowguid"
  ,"ModifiedDate"
FROM source