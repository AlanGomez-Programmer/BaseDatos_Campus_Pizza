USE Campus_pizza;

# Insertar los tipos de producto
INSERT INTO Tipo_producto(tipo_producto) VALUES
('Pizza'),
('Panzarottis'),
('Pasta');

# Insertar los datos de los productos
INSERT INTO Productos(tipo_producto_id, nombre, descripcion, precio) VALUES
(1, 'Pizza Hawaiana', 'Pizza con queso, jamon y con piña', 50.00),
(1, 'Pizza Pepperoni', 'Pizza con queso y Pepperoni', 55.00),
(1, 'Pizza Jamón', 'Pizza con queso y jamón', 50.00),
(2, 'Panzarotti Jamón', 'Panzarotti de jamón', 45.00),
(2, 'Panzarotti Pepperoni', 'Panzarotti de Pepperoni', 45.00);

# Insertar los datos de adicionales para los productos
INSERT INTO Adicionales(nombre, precio) VALUES
('Extra Queso', 10.00),
('Palitroquets', 5.00),
('Ingrediente extra', 10);

# Insertar los datos Combo
INSERT INTO Combos(nombre, precio) VALUES 
('Combo Familiar', 100.00),
('Combo Familiar Deluxe', 140.00),
('Combo Pareja', 75.00);

# Insertar los datos Combo y producto
INSERT INTO Combo_detalle VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5);

# Insertar los datos de tipo de menú
INSERT INTO Tipo_menu(nombre) VALUES 
('Pizzas'),
('Panzarottis'),
('Combos'),
('Adicionales');

# Insertar los datos de Menu
INSERT INTO Menu(tipo_menu, producto_id, combo_id, adicional_id) VALUES 
(1, 1),
(1, 2),
(1, 2);