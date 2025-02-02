PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    telefono TEXT
);
INSERT INTO Usuarios VALUES(1,'Juan Perez','juan@example.com','1234567890');
CREATE TABLE Autores (
    id_autor INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    nacionalidad TEXT
);
INSERT INTO Autores VALUES(1,'Gabriel Garcia Marquez','Colombiana');
CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);
INSERT INTO Categorias VALUES(1,'Novela');
CREATE TABLE Libros (
    id_libro INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    id_autor INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autores (id_autor),
    FOREIGN KEY (id_categoria) REFERENCES Categorias (id_categoria)
);
INSERT INTO Libros VALUES(1,'Cien años de soledad',1,1,5);
CREATE TABLE Prestamos (
    id_prestamo INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL,
    id_libro INTEGER NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros (id_libro)
);
INSERT INTO Prestamos VALUES(1,1,1,'2025-01-28',NULL);
INSERT INTO sqlite_sequence VALUES('Usuarios',1);
INSERT INTO sqlite_sequence VALUES('Autores',1);
INSERT INTO sqlite_sequence VALUES('Categorias',1);
INSERT INTO sqlite_sequence VALUES('Libros',1);
INSERT INTO sqlite_sequence VALUES('Prestamos',1);
COMMIT;
