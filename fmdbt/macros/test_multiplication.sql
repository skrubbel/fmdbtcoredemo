{% test multiplication(model, unit_value_column, multiplier_column, discount_column, target_value) %}

    SELECT 
        *
    from {{ model }}
    WHERE {{ unit_value_column }} * {{ multiplier_column }} - ({{ unit_value_column }} * {{multiplier_column}} * {{discount_column}}) <> {{ target_value }}

{% endtest %}

