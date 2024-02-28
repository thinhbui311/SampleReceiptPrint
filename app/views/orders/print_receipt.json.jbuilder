json.line_items @line_items, :quantity, :product_name, :total_price
json.sales_taxes @order.total_tax
json.total @order.total_price
