{% macro generate_base_model(source_name, table_name, case_sensitive_cols=False, materialized=None) %}

{%- set source_relation = source(source_name, table_name) -%}

{%- set columns = adapter.get_columns_in_relation(source_relation) -%}
{% set column_names=columns | map(attribute='name') %}
{% set base_model_sql %}

{%- if materialized is not none -%}
	{{ "{{ config(materialized='" ~ materialized ~ "') }}" }}
{%- endif %}

WITH source AS (
	SELECT *

	FROM {% raw %}{{ source({% endraw %}'{{ source_name }}', '{{ table_name }}'{% raw %}) }}{% endraw %}
)

SELECT
{%- for column in column_names %}
	{{ column }}{{"," if not loop.last}}
{%- endfor %}

FROM source

{% endset %}

{% if execute %}

{{ log(base_model_sql, info=True) }}
{% do return(base_model_sql) %}

{% endif %}
{% endmacro %}