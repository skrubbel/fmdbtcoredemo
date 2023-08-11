WITH source AS (
  SELECT
    CONCAT(
      cus."CustomerID"
      ,'#'
      ,ISNULL(cus."PersonID", '')
      ,'#'
      , ISNULL(cus."StoreID", '')
      , '#'
      , ISNULL(cus."TerritoryID", '')
      ,'#'
      ,ISNULL(cus."AccountNumber", '')
    ) AS CustomerKey
    ,cus."CustomerID"
    ,cus."PersonID"
    ,cus."StoreID"
    ,cus."TerritoryID"
    ,cus."AccountNumber"
    ,cus."rowguid"
    ,CASE WHEN cus."ModifiedDate" > prs.[ModifiedDate] THEN cus."ModifiedDate" ELSE prs."ModifiedDate" END AS ModifiedDate
    ,fld."FirstOrderDate"
    ,fld."LastOrderDate"
    ,CONCAT(
      ISNULL(prs."FirstName", 'Customer#:')
      ,' '
      ,ISNULL(prs."LastName", CAST(cus."CustomerID" AS varchar(20)))
    ) AS CustomerDisplayName
    ,ISNULL(prs."FirstName", 'Customer#') AS FirstName
    ,ISNULL(prs."LastName", CAST(cus."CustomerID" AS varchar(20))) AS LastName
  FROM {{ ref('raw_Customer') }} cus
    LEFT JOIN {{ ref('raw_Person') }} prs
      ON cus."PersonID" = prs."BusinessEntityID"
    LEFT JOIN {{ ref('eph_first_last_order_date_by_customer_id') }} fld
      ON cus."CustomerID" = fld."CustomerID"
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
