{% test our_not_null(model, column_name) %}

    SELECT 
        *
    from {{ model }}
    WHERE {{ column_name }} IS NULL

{% endtest %}