USE AdventureWorks2019;
GO

-- 1. Crear el rol de base de datos db_SalesReadOnly
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_SalesReadOnly' AND type = 'R')
BEGIN
    CREATE ROLE db_SalesReadOnly AUTHORIZATION dbo;
    PRINT 'Rol db_SalesReadOnly creado exitosamente.';
END
ELSE
BEGIN
    PRINT 'El rol db_SalesReadOnly ya existe.';
END
GO

-- 2. Asignar permisos SELECT a las tablas relacionadas con ventas
-- Esquema Sales
GRANT SELECT ON Sales.SalesOrderHeader TO db_SalesReadOnly;
GRANT SELECT ON Sales.SalesOrderDetail TO db_SalesReadOnly;
GRANT SELECT ON Sales.Customer TO db_SalesReadOnly;
GRANT SELECT ON Sales.Store TO db_SalesReadOnly; -- Si necesitas ver tiendas
GRANT SELECT ON Sales.SalesPerson TO db_SalesReadOnly; -- Si necesitas ver vendedores
GRANT SELECT ON Sales.CurrencyRate TO db_SalesReadOnly; -- Si necesitas ver tasas de cambio

-- Esquema Production (productos están relacionados con ventas)
GRANT SELECT ON Production.Product TO db_SalesReadOnly;
GRANT SELECT ON Production.ProductCategory TO db_SalesReadOnly;
GRANT SELECT ON Production.ProductSubcategory TO db_SalesReadOnly;

PRINT 'Permisos SELECT asignados a db_SalesReadOnly.';
GO