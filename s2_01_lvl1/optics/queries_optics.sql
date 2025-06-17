USE optics;

-- List the total invoices for a customer in a given period
SELECT 
    c.name AS client_name,
    c.email,
    i.date,
    i.total
FROM invoice i
JOIN client c USING(id_client)
WHERE i.date BETWEEN '2025-01-01' AND '2025-12-31'
  AND c.id_client = 1; -- Puedes cambiar el ID del cliente

-- List the different models of glasses that an employee has sold during a year
SELECT 
    g.brand,
    gl.color AS glass_color,
    f.color AS frame_color,
    f.frame_material,
    g.price,
    i.date
FROM invoice i
JOIN glasses g ON i.id_glasses = g.id_glasses
JOIN glass gl ON g.id_glass = gl.id_glass
JOIN frame f ON g.id_frame = f.id_frame
WHERE i.id_employee = 2 -- ID del empleado que ha hecho la venta
  AND YEAR(i.date) = 2025;

-- List the different suppliers that have supplied glasses that have been successfully sold by the optician
SELECT DISTINCT 
    s.name AS supplier_name,
    s.nif,
    s.telf
FROM invoice i
JOIN glasses g ON i.id_glasses = g.id_glasses
JOIN brand_supplier bs ON g.brand = bs.brand
JOIN supplier s ON bs.id_supplier = s.id_supplier;

-- Additional query: Employee who sold the glasses
SELECT 
    e.name AS employee_name,
    e.surname AS employee_surname,
    g.brand AS glasses_brand,
    g.price AS price
FROM glasses g
JOIN employee e ON g.id_seller = e.id_employee
ORDER BY e.name;

-- Additional query: Glasses supplier
SELECT 
    g.brand AS glasses_brand,
    s.name AS supplier,
    s.telf,
    s.nif
FROM glasses g
JOIN brand_supplier bs ON g.brand = bs.brand
JOIN supplier s ON bs.id_supplier = s.id_supplier;

-- Additional query: Customer who recommended the establishment
SELECT 
    c1.name AS client,
    c2.name AS recommended_by
FROM client c1
JOIN client c2 ON c1.id_recommended_by = c2.id_client;