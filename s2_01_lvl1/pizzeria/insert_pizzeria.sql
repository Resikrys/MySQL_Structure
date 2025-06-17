USE pizzeria;

-- Provinces
INSERT INTO province (name) VALUES 
('Barcelona'), 
('Girona');

-- Localities
INSERT INTO locality (name, province_id) VALUES 
('Manresa', 1), 
('Vic', 1),
('Figueres', 2);

-- Address
INSERT INTO address (street, number, floor, door, postal_code, locality_id, province_id) VALUES
('Carrer Major', 12, 1, 2, 08241, 1, 1),
('Av. Catalunya', 5, 2, 1, 08500, 2, 1),
('Rambla Nova', 3, 3, 2, 17600, 3, 2);

-- Customers
INSERT INTO customer (name, surname, address_id, locality_id, province_id, phone) VALUES
('Liam', 'Vittori', 1, 1, 1, '612345678'),
('Jun', 'Misugi', 2, 2, 1, '623456789');

-- Shops
INSERT INTO shop (name, address_id, locality_id, province_id) VALUES
('La cosa nostra', 1, 1, 1),
('Pizzeria Figueres', 3, 3, 2);

-- Employees
INSERT INTO employee (name, surname, nif, phone, role, shop_id) VALUES
('Nova', 'Andorrana', '12345678A', '634567890', 'COOK', 1),
('Astro', 'Venedetti', '87654321B', '645678901', 'DELIVERY', 1),
('Cosmo', 'Boix', '11223344C', '656789012', 'COOK', 2);

-- Categories
INSERT INTO category (name) VALUES 
('Classic'), 
('Special');

-- Products
INSERT INTO product (name, description, image, price, type) VALUES
('Cheese Xtrm!!', 'Pizza with a delicious combination of 7 top quality cheeses', 'cheeseX.jpg', 8.50, 'PIZZA'),
('Veggies', 'Vegan pizza with a wide variety of products directly from the garden', 'veggies.jpg', 9.50, 'PIZZA'),
('Chick Burger BBQ', 'Grilled chicken burger with sweet BBQ sauce', 'chickburger_bbq.jpg', 7.90, 'BURGER'),
('CocaCola', 'Cola softdrink', 'cocacola.jpg', 1.80, 'DRINK');

-- Pizzas (by category)
INSERT INTO pizza (id_pizza, category_id) VALUES
(1, 1),
(2, 2);

-- Orders
INSERT INTO orders (customer_id, shop_id, created_at, is_delivery, total_price, delivery_employee_id, delivery_datetime) VALUES
(1, 1, '2025-06-13 19:30:00', TRUE, 20.80, 2, '2025-06-13 20:00:00'),
(2, 2, '2025-06-13 20:15:00', FALSE, 9.50, NULL, NULL);

-- Orders detail
INSERT INTO orders_detail (orders_id, product_id, quantity) VALUES
(1, 1, 1),  -- Cheese Xtrm!!
(1, 4, 2),  -- CocaCola x2
(2, 2, 1);  -- Veggies
