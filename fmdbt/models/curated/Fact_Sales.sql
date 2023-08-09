
WITH source AS (
  SELECT
    [SalesOrderID]
    ,[RevisionNumber]
    ,[OrderDate]
    ,[DueDate]
    ,[ShipDate]
    ,[Status]
    ,[OnlineOrderFlag]
    ,[SalesOrderNumber]
    ,[PurchaseOrderNumber]
    ,[AccountNumber]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[TerritoryID]
    ,[BillToAddressID]
    ,[ShipToAddressID]
    ,[ShipMethodID]
    ,[CreditCardID]
    ,[CreditCardApprovalCode]
    ,[CurrencyRateID]
    ,[SubTotal]
    ,[TaxAmt]
    ,[Freight]
    ,[TotalDue]
    ,[Comment]
    ,[HeaderRowGuid]
    ,[HeaderModifiedDate]
    -- Detail
    ,[SalesOrderDetailID]
    ,[CarrierTrackingNumber]
    ,[OrderQty]
    ,[ProductID]
    ,[SpecialOfferID]
    ,[UnitPrice]
    ,[UnitPriceDiscount]
    ,[LineTotal]
    ,[DetailRowGuid]
    ,[DetailsModifiedDate]
  FROM {{ ref("enriched_SalesTransactions") }}
)

SELECT
  *
FROM source
