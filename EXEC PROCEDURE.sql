USE StaffAccounting;
GO

DECLARE @id_emp INT

DECLARE cur CURSOR FAST_FORWARD FOR
SELECT id_employee
FROM Employee

OPEN cur

FETCH NEXT FROM cur INTO @id_emp
EXEC Experience @id_emp

WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM cur INTO @id_emp
	EXEC Experience @id_emp
END
GO

SELECT Department.department_id,Department.name, dbo.Payroll(department_id, '2013-12-09') AS Total
FROM Department