WITH source AS (
  SELECT *

  FROM {{ source('dbo', 'SalesOrderDetail') }}
)

SELECT DISTINCT
  [SalesOrderID],
  [SalesOrderDetailID],
  [CarrierTrackingNumber],
  [OrderQty],
  [ProductID],
  [SpecialOfferID],
  [UnitPrice],
  [UnitPriceDiscount],
  [LineTotal],
  [rowguid],
  [ModifiedDate]
FROM source
