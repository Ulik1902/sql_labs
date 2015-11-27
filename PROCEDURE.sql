USE StaffAccounting
GO
DROP PROCEDURE Experience
GO
CREATE PROCEDURE Experience (@employee_id INT)
AS BEGIN
	DECLARE @DaysOfWork INT
	SELECT @DaysOfWork = SUM (DATEDIFF (day, begin_date, CASE WHEN end_date IS NULL THEN GETDATE() ELSE end_date END))
	FROM Post_journal
	WHERE employee_id = @employee_id
	PRINT @DaysOfWork*0.012/365
	UPDATE Employee
	SET experience = (@DaysOfWork/365)*0.012
	WHERE id_employee = @employee_id

END
GO

