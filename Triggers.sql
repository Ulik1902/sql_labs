USE StaffAccounting;
GO

DROP TRIGGER Boss_homonym
GO

CREATE TRIGGER Boss_homonym 
ON Post_journal
AFTER INSERT 
AS BEGIN
	DECLARE @BossLastName VARCHAR(100)
	DECLARE @EmployeeLastName VARCHAR (100)
	SELECT @BossLastName = Passport_data.last_name
	FROM  Post_journal JOIN Passport_data ON  Post_journal.employee_id=Passport_data.passport_id
	WHERE Post_journal.end_date IS NULL AND Post_journal.post_id=100 AND Post_journal.department_id IN (
		SELECT department_id
		FROM inserted
	) 
	SELECT @EmployeeLastName = Passport_data.last_name
	FROM Passport_data
	WHERE passport_id IN (
		SELECT employee_id
		FROM inserted 
	)
	IF (@EmployeeLastName = @BossLastName)
	BEGIN
		PRINT 'You cannot add a boss'' homonym to the same department'
		ROLLBACK TRANSACTION
	END
END
GO

DROP TRIGGER EmployeeCount
GO
CREATE TRIGGER EmployeeCount
ON Post_journal
AFTER INSERT, UPDATE 
AS BEGIN 
	IF (SELECT COUNT (*)
	FROM Post_journal
	WHERE  end_date IS NULL AND department_id IN(
		SELECT department_id
		FROM inserted
	)) > 20
	BEGIN
		PRINT 'TOO MANY EMPLOYEES '
		ROLLBACK TRANSACTION
	END
END

DROP TRIGGER 