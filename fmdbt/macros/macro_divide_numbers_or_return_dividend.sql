{% macro divide_numbers_or_return_dividend(dividend_column_name, divisor_column_name, precision=38, scale=20) %}
    CASE WHEN {{ divisor_column_name }} IS NOT NULL AND {{ divisor_column_name }} <> 0 THEN
        CAST(({{ dividend_column_name }} / {{ divisor_column_name }}) AS decimal({{ precision}}, {{ scale }}))
    ELSE 
        CAST({{ dividend_column_name }} AS decimal({{ precision}}, {{ scale }}))
    END
{% endmacro %}