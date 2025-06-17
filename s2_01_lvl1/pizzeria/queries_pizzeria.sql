USE pizzeria;

-- Lists how many products in the 'Drink' category have been sold in a given location
SELECT l.name AS locality, SUM(od.quantity) AS total
FROM orders o
         INNER JOIN customer c ON o.customer_id = c.id_customer
         INNER JOIN locality l ON c.locality_id = l.id
         INNER JOIN orders_detail od ON o.id_orders = od.orders_id
         INNER JOIN product p ON od.product_id = p.id_product
WHERE p.type = 'DRINK'
  AND l.name = 'Girona'
GROUP BY l.name;

-- Lists how many orders a given employee has placed
SELECT CONCAT(e.name, ' ', e.surname) employee, COUNT(o.id_orders) AS total_orders
FROM employee e
JOIN orders o ON o.delivery_employee_id = e.id_employee
WHERE e.id_employee = 2;
GROUP BY e.id_employee;

-- Additional query: Displays the customer's name, date, and amount of orders placed
SELECT 
    c.name AS client_name,
    c.surname AS client_surname,
    o.created_at,
    o.total_price
FROM orders o
JOIN customer c ON o.customer_id = c.id_customer
ORDER BY o.created_at DESC;

-- Additional query: Displays information about the pizzas that have been ordered, including the category name
SELECT 
    p.name AS pizza_name,
    cat.name AS category_name,
    od.quantity,
    o.created_at
FROM orders_detail od
JOIN product p ON od.product_id = p.id_product
JOIN pizza pi ON pi.id_pizza = p.id_product
JOIN category cat ON pi.category_id = cat.id_category
JOIN orders o ON od.orders_id = o.id_orders
WHERE p.type = 'PIZZA'
ORDER BY o.created_at DESC;

-- Additional query: Show delivery driver and delivery date/time for home orders
SELECT 
    e.name AS delivery_employee_name,
    e.surname AS delivery_employee_surname,
    o.id_orders,
    o.delivery_datetime
FROM orders o
JOIN employee e ON o.delivery_employee_id = e.id_employee
WHERE o.is_delivery = TRUE
ORDER BY o.delivery_datetime DESC;

-- Additional query: best-selling products
SELECT 
    p.name AS product_name,
    SUM(od.quantity) AS total_sold
FROM orders_detail od
JOIN product p ON od.product_id = p.id_product
GROUP BY p.id_product, p.name
ORDER BY total_sold DESC;

-- Additional query: orders per store
SELECT 
    s.name AS shop_name,
    COUNT(o.id_orders) AS total_orders,
    SUM(o.total_price) AS total_revenue
FROM orders o
JOIN shop s ON o.shop_id = s.id_shop
GROUP BY s.id_shop, s.name
ORDER BY total_orders DESC;

-- Additional query: customers with more orders
SELECT 
    c.name,
    c.surname,
    COUNT(o.id_orders) AS total_orders,
    SUM(o.total_price) AS total_spent
FROM customer c
JOIN orders o ON c.id_customer = o.customer_id
GROUP BY c.id_customer, c.name, c.surname
ORDER BY total_orders DESC;
