use sales;

-- Tổng số lượng khách hàng -> 38 customers
select COUNT(customer_code) as SoLuongKhachHang
from customers;

-- Loại khách hàng nào thường xuyên mua -> E-comerce: 19, Brick & Mortar: 19
select count(customer_code) as SoLuongKhachHang, customer_type
from customers
group by customer_type;

-- Khách hàng hay mua những món hàng nào?
select COUNT(c.customer_code) as SoLuongKhachHang, p.product_type
from customers c
inner join transactions tr on c.customer_code = tr.customer_code
inner join products p on tr.product_code = p.product_code
group by p.product_type;

-- Revenue of customers
select c.customer_type, tr.sales_amount, tr.currency, tr.profit_margin
from customers c
inner join transactions tr on tr.customer_code = c.customer_code
