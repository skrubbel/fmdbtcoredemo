{% snapshot snapshot__enriched_Customer %}

{{
	config(
		target_schema='dbt_snapshots',
		unique_key='CustomerKey',
		strategy='check',
		check_cols=['PersonID', 'StoreID', 'TerritoryID', 'AccountNumber', 'CustomerDisplayName'],
		invalidate_hard_deletes=True
	)
}}

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
FROM {{ ref('enriched_Customer') }}

{% endsnapshot %}