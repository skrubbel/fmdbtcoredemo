WITH source AS (
  SELECT
    *
  FROM {{ ref('enriched_Customer') }}
)

SELECT
    "CustomerKey"
    ,"CustomerID"
    ,"PersonID"
    ,"StoreID"
    ,"TerritoryID"
    ,"AccountNumber"
    ,"rowguid"
    ,"ModifiedDate"
    ,"FirstOrderDate"
    ,"LastOrderDate"
    ,"CustomerDisplayName"
    ,"FirstName"
    ,"LastName"
FROM source
