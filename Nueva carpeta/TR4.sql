USE bd2;
GO
CREATE PROCEDURE TR4
    @email          VARCHAR(50)
AS
BEGIN
	UPDATE practica1.Usuarios SET EmailConfirmed=1 WHERE email=@email
	PRINT N' Valid email...'
END