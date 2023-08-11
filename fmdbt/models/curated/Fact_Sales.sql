
WITH source AS (
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
  FROM {{ ref("enriched_SalesTransactions") }}
)

SELECT
  *
FROM source
