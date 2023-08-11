WITH source AS (
  SELECT
    sh."SalesOrderID"
    ,sh."RevisionNumber"
    ,sh."OrderDate"
    ,sh."DueDate"
    ,sh."ShipDate"
    ,sh."Status"
    ,sh."OnlineOrderFlag"
    ,sh."SalesOrderNumber"
    ,sh."PurchaseOrderNumber"
    ,sh."AccountNumber"
    ,sh."CustomerID"
    ,sh."SalesPersonID"
    ,sh."TerritoryID"
    ,sh."BillToAddressID"
    ,sh."ShipToAddressID"
    ,sh."ShipMethodID"
    ,sh."CreditCardID"
    ,sh."CreditCardApprovalCode"
    ,sh."CurrencyRateID"
    -- ,sh."SubTotal"
    -- ,sh."TaxAmt"
    -- ,sh."Freight"
    -- ,sh."TotalDue"
    ,{{ divide_numbers_or_return_dividend('sh.TaxAmt', 'lc.SalesOrderDetailLineCount', 38, 4) }} AS Calc_TaxAmtQuota
    ,{{ divide_numbers_or_return_dividend('sh.Freight', 'lc.SalesOrderDetailLineCount', 38, 4) }} AS Calc_FreightQuota
    ,sh."Comment"
    ,sh."rowguid" AS HeaderRowGuid
    ,sh."ModifiedDate" AS HeaderModifiedDate
    -- Detail
    ,sd."SalesOrderDetailID"
    ,sd."CarrierTrackingNumber"
    ,sd."OrderQty"
    ,sd."ProductID"
    ,sd."SpecialOfferID"
    ,sd."UnitPrice"
    ,sd."UnitPriceDiscount"
    ,sd."LineTotal"
    ,sd."rowguid" AS DetailRowGuid
    ,sd."ModifiedDate" AS DetailsModifiedDate
  FROM {{ ref("raw_SalesOrderHeader") }} sh
    LEFT JOIN {{ ref("raw_SalesOrderDetail")}} sd
      ON  sh."SalesOrderID" = sd."SalesOrderID"
    LEFT JOIN {{ ref("eph_count_order_detail_lines_by_order_id")}} lc
      ON sh."SalesOrderID" = lc."SalesOrderID"
)

SELECT
  "SalesOrderID"
  ,"RevisionNumber"
  ,"OrderDate"
  ,"DueDate"
  ,"ShipDate"
  ,"Status"
  ,"OnlineOrderFlag"
  ,"SalesOrderNumber"
  ,"PurchaseOrderNumber"
  ,"AccountNumber"
  ,"CustomerID"
  ,"SalesPersonID"
  ,"TerritoryID"
  ,"BillToAddressID"
  ,"ShipToAddressID"
  ,"ShipMethodID"
  ,"CreditCardID"
  ,"CreditCardApprovalCode"
  ,"CurrencyRateID"
  ,"Calc_TaxAmtQuota"
  ,"Calc_FreightQuota"
  ,"Comment"
  ,"HeaderRowGuid"
  ,"HeaderModifiedDate"
  -- Detail
  ,"SalesOrderDetailID"
  ,"CarrierTrackingNumber"
  ,"OrderQty"
  ,"ProductID"
  ,"SpecialOfferID"
  ,"UnitPrice"
  ,"UnitPriceDiscount"
  ,"LineTotal"
  ,"DetailRowGuid"
  ,"DetailsModifiedDate"
FROM source
