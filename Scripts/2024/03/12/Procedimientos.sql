USE Northwind

GO

CREATE PROCEDURE dbo.mathtutor
    @m1 SMALLINT,
    @m2 SMALLINT,
    @result SMALLINT OUTPUT
    AS
        SET @result = @m1 * @m2

GO

DECLARE @answer SMALLINT
DECLARE @f SMALLINT
SET @f = 8
EXECUTE mathtutor @f, 10, @answer OUTPUT
SELECT 'The result is: ', @answer

