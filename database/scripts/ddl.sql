# Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Campus_pizza;

# Indicar la base de datos a utilizar
USE Campus_pizza;

-- Creación de Tablas
# Tipo de Producto
CREATE TABLE IF NOT EXISTS Tipo_producto (
	id_tipo_producto INT AUTO_INCREMENT,
    tipo_producto VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tipo_producto)
);

# Productos
CREATE TABLE IF NOT EXISTS Productos (
	id_producto INT AUTO_INCREMENT,
    tipo_producto_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (tipo_producto_id) REFERENCES Tipo_producto(id_tipo_producto)
);

# Adicionales
CREATE TABLE IF NOT EXISTS Adicionales (
	id_adicional INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2) DEFAULT 0,
    PRIMARY KEY (id_adicional)
);

# Combo
CREATE TABLE IF NOT EXISTS Combos (
	id_combo INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    PRIMARY KEY (id_combo)
);

# Tabla de Unión para Combo y Producto
CREATE TABLE IF NOT EXISTS Combo_detalle (
	id_combo INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_combo, id_producto),
    FOREIGN KEY (id_combo) REFERENCES Combos(id_combo),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

# Tipo Menú
CREATE TABLE IF NOT EXISTS Tipo_menu (
	id_tipo_menu INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (id_tipo_menu)
);

# Menú
CREATE TABLE IF NOT EXISTS Menu (
	id_menu INT AUTO_INCREMENT,
    tipo_menu_id INT NOT NULL,
    producto_id INT DEFAULT 0,
    combo_id INT DEFAULT 0,
    adicional_id INT DEFAULT 0,
    PRIMARY KEY (id_menu)
);

# Clientes
CREATE TABLE IF NOT EXISTS Clientes (
	id_cliente INT AUTO_INCREMENT,
    dpi VARCHAR(13) NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(8) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_cliente)
);

# Tipo Pedido
CREATE TABLE IF NOT EXISTS Tipo_pedido (
	id_tipo_pedido INT AUTO_INCREMENT,
    tipo_pedido VARCHAR(50),
    PRIMARY KEY (id_tipo_pedido)
);

# Estado
CREATE TABLE IF NOT EXISTS Estados (
	id_estado INT AUTO_INCREMENT,
    estado VARCHAR(50),
    PRIMARY KEY (id_estado)
);

# Detalle Pedido
CREATE TABLE IF NOT EXISTS Detalle_pedido (
	id_detalle_pedido INT AUTO_INCREMENT,
    tipo_pedido_id INT NOT NULL,
    producto_id INT NOT NULL DEFAULT 0,
    adicional_id INT NOT NULL DEFAULT 0,
    combo_id INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_detalle_pedido),
    FOREIGN KEY (tipo_pedido_id) REFERENCES Tipo_pedido(id_tipo_pedido),
    FOREIGN KEY (producto_id) REFERENCES Productos(id_producto),
    FOREIGN KEY (adicional_id) REFERENCES Adicionales(id_adicional),
    FOREIGN KEY (combo_id) REFERENCES Combos(id_combo)
);

# Pedido 
CREATE TABLE IF NOT EXISTS Pedidos (
	id_pedido INT AUTO_INCREMENT,
    estado_id INT NOT NULL,
    cliente_id INT NOT NULL,
    detalle_pedido_id INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (estado_id) REFERENCES Estados(id_estado),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (detalle_pedido_id) REFERENCES Detalle_pedido(id_detalle_pedido)
);

