USE BD2;
GO
CREATE PROCEDURE TR1
    @firstname      VARCHAR(50),
    @lastname       VARCHAR(50),
    @email          VARCHAR(50),
    @password       VARCHAR(50),
    @credits        INTEGER
AS
BEGIN
    PRINT N'Validate email...'
    DECLARE @idRolStudent VARCHAR(50)
    IF (SELECT COUNT(*) FROM practica1.Usuarios WHERE Email=@email) < 1 
	BEGIN
        DECLARE @idUser VARCHAR(50) = NEWID()
        PRINT N'Saving User...'
        INSERT INTO practica1.Usuarios(Id, Firstname, Lastname, Email, DateOfBirth, Password, LastChanges, EmailConfirmed)
        VALUES(@idUser, @firstname, @lastname, @email, GETDATE(), @password, GETDATE(), 0)
        PRINT N'Role Assigned successfully...'
        SELECT @idRolStudent=Id FROM practica1.Roles WHERE RoleName='Student'
        INSERT INTO practica1.UsuarioRole(RoleId, UserId, IsLatestVersion)
        VALUES (@idRolStudent, @idUser, 1)
        PRINT N'Profile created successfully...'
        INSERT INTO practica1.ProfileStudent(UserId, Credits)
        VALUES (@idUser, @credits)
        PRINT N'TFA applied...'
        INSERT INTO practica1.TFA(UserId, Status, LastUpdate)
            VALUES(@idUser, 1, GETDATE())
        PRINT N'Notification is made...'
        INSERT INTO practica1.Notification(UserId, Message, Date)
            VALUES(@idUser, 'The user is created', GETDATE())
		INSERT INTO practica1.HistoryLog(Date, Description)
                        VALUES (GETDATE(), 'Transaction 1 finished successfully')
		PRINT N'Creating log record...'
    END
    ELSE BEGIN
        PRINT N'[Error] Email already registered...'
    END
END
