USE AdventureWorks2019;
GO

-- 1. Crear el rol de base de datos db_HumanResourcesAdmin
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_HumanResourcesAdmin' AND type = 'R')
BEGIN
    CREATE ROLE db_HumanResourcesAdmin AUTHORIZATION dbo;
    PRINT 'Rol db_HumanResourcesAdmin creado exitosamente.';
END
ELSE
BEGIN
    PRINT 'El rol db_HumanResourcesAdmin ya existe.';
END
GO

-- 2. Asignar permisos SELECT, INSERT, UPDATE, DELETE a las tablas de Recursos Humanos
-- Esquema HumanResources
GRANT SELECT, INSERT, UPDATE, DELETE ON HumanResources.Employee TO db_HumanResourcesAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON HumanResources.EmployeeDepartmentHistory TO db_HumanResourcesAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON HumanResources.EmployeePayHistory TO db_HumanResourcesAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON HumanResources.JobCandidate TO db_HumanResourcesAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON HumanResources.Department TO db_HumanResourcesAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON HumanResources.Shift TO db_HumanResourcesAdmin;

-- También podría ser útil tener acceso a la información de Person.Person
GRANT SELECT ON Person.Person TO db_HumanResourcesAdmin;

PRINT 'Permisos SELECT, INSERT, UPDATE, DELETE asignados a db_HumanResourcesAdmin.';
GO