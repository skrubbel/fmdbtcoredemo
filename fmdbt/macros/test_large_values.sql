{% test large_values(model, column_name, threshold_value) %}

    SELECT 
        *
    from {{ model }}
    WHERE {{ column_name }} > {{ threshold_value }}

{% endtest %}