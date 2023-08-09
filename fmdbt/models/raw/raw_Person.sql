WITH source AS (
  SELECT *

  FROM {{ source('dbo', 'Person') }}
)

SELECT DISTINCT
  [BusinessEntityID],
  [PersonType],
  [NameStyle],
  [Title],
  [FirstName],
  [MiddleName],
  [LastName],
  [Suffix],
  [EmailPromotion],
  [AdditionalContactInfo],
  [Demographics],
  [rowguid],
  [ModifiedDate]
FROM source
