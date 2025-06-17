USE optics;

-- Adress
INSERT INTO adress VALUES
(1, 's/ Mount valley', 1412, 3, 1, 'Gondor', 42, 'Middle earth'),
(2, 's/ Evergreen terrace', 742, 1, 2, 'Springfield', 88, 'USA');

-- Supplier
INSERT INTO supplier VALUES
(1, 'Dungeons & Glasses', 1, '213-1412-00', '+44-213-1412-00', 'AZ-123456789'),
(2, 'Clear eyes', 2, '555-002-013', '+34-555-002-013', 'ZA-987654321');

-- Brand-Supplier
INSERT INTO brand_supplier VALUES
('Ranking kings', 1),
('Sir Lancelot', 2),
('White water', 1);

-- Glass
INSERT INTO glass VALUES
(1, 6.75, 'blue'),
(2, 1.25, 'transparent');

-- Frame
INSERT INTO frame VALUES
(1, 'paste', 'yellow'),
(2, 'metallic', 'pink'),
(3, 'floating', 'silver');

-- Employee
INSERT INTO employee VALUES
(1, 'Happy', 'Dog', 'seller'),
(2, 'Elyrion', 'Random', 'seller');

-- Client
INSERT INTO client (id_client, name, postal_code, telf, email, register, id_recommended_by) VALUES
(1, 'Allegretto', 2089, '+94-666-00-222', 'thegreatestbard@flutenote.com', '2025-06-14', NULL),
(2, 'Yang', 97089, '+40-222-22-222', 'yang@example.com', '2025-07-01', 1);

-- Glasses
INSERT INTO glasses VALUES
(1, 'Ranking kings', 1, 3, 123.98, 1),
(2, 'Sir Lancelot', 2, 2, 134.55, 2),
(3, 'White water', 1, 1, 48.25, 1);

-- Invoice
INSERT INTO invoice (id_client, id_glasses, id_employee, date, total) VALUES
(1, 2, 2, '2025-06-14', 134.55),
(2, 3, 1, '2025-07-01', 48.25);