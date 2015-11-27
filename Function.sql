USE StaffAccounting
GO
DROP FUNCTION Payroll
GO
CREATE FUNCTION Payroll(@department_id INT, @month DATE)
RETURNS MONEY
AS BEGIN
	DECLARE @Total MONEY
	DECLARE @start_month DATE
	SET @start_month= DATEADD (month, DATEDIFF (month,0, @month), 0)
	SET @month= DATEADD (second, -1, DATEADD(mm, DATEDIFF (month,0, @month)+1, 0))
	SELECT @Total = CAST(SUM(Post.salary * (1 + Employee.experience)) AS NUMERIC (10, 2))
	FROM Post_journal JOIN Post
	ON Post_journal.post_id = Post.post_id JOIN Employee
	ON Employee.id_employee = Post_journal.employee_id
	WHERE department_id = @department_id AND (end_date >= @month OR end_date IS NULL) AND begin_date <= @start_month
	RETURN @Total
END

GO
