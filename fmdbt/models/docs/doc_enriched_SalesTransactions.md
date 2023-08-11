{% docs enriched_SalesTransactions %}

This is a longer description of how we combine data from the **raw_SalesHeader** and **raw_SalesDetail** tables into enriched_SalesTransactions. And how we utilize the ephemeral model **eph_count_order_detail_lines_by_order_id** to divide and break down header-based amounts to the SalesDetail transactional level.

We can show this in a Markdown code block.

```jinja2

SELECT
  "SalesOrderID"
  ,COUNT("SalesOrderDetailID") AS SalesOrderDetailLineCount
FROM raw_SalesOrderDetail
GROUP BY "SalesOrderID"
```

Or we could provide a link to the [documentation](file:///C:/Users/JanPoulsenSkrubbeltr/source/repos/FmDbtCoreDemo_Project/docs/public/index.html#!/model/model.fmdbt.eph_count_order_detail_lines_by_order_id) for this macro.

{% enddocs %}