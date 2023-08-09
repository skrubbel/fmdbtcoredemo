WITH source AS (
  SELECT *

  FROM {{ source('dbo', 'SalesOrderHeader') }}
)

SELECT DISTINCT
  [SalesOrderID],
  [RevisionNumber],
  [OrderDate],
  [DueDate],
  [ShipDate],
  [Status],
  [OnlineOrderFlag],
  [SalesOrderNumber],
  [PurchaseOrderNumber],
  [AccountNumber],
  [CustomerID],
  [SalesPersonID],
  [TerritoryID],
  [BillToAddressID],
  [ShipToAddressID],
  [ShipMethodID],
  [CreditCardID],
  [CreditCardApprovalCode],
  [CurrencyRateID],
  [SubTotal],
  [TaxAmt],
  [Freight],
  [TotalDue],
  [Comment],
  [rowguid],
  [ModifiedDate]
FROM source
