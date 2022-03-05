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

-- -----------------------------------------------------------------------------------------
USE BD2;
GO
CREATE PROCEDURE TR2
    @email          VARCHAR(50),
    @codCourse      INTEGER
AS
BEGIN
    DECLARE @idUser VARCHAR(50)
    DECLARE @activo bit = 0
    DECLARE @idRolTutor VARCHAR(50)
    DECLARE @tutorCode VARCHAR(50)

    BEGIN TRY

        BEGIN TRANSACTION
            PRINT N'Verifying that the user exists...'
            SELECT @idUser=Id, @activo=EmailConfirmed FROM practica1.Usuarios WHERE Email=@email

            IF @idUser IS NOT NULL BEGIN
                IF @activo = 1 BEGIN

                    SELECT @idRolTutor=Id FROM practica1.Roles WHERE RoleName='Tutor'
                    INSERT INTO practica1.UsuarioRole(RoleId, UserId, IsLatestVersion)
                        VALUES (@idRolTutor, @idUser, 1)
					PRINT N'Assigned tutor role'

                    SELECT @tutorCode=Id FROM practica1.UsuarioRole WHERE RoleId=@idRolTutor AND UserId=@idUser
                    INSERT INTO practica1.TutorProfile(UserId, TutorCode)
                        VALUES (@idUser, @tutorCode)
					PRINT N'Tutor profile created'
                    PRINT N'Assigning your course...'
                    IF (SELECT COUNT(*) FROM practica1.CourseTutor WHERE TutorId=@idUser) < 1 BEGIN
                        INSERT INTO practica1.CourseTutor(TutorId, CourseCodCourse)
                        VALUES (@idUser, @codCourse)
						PRINT N'The tutor was assigned to the course'
                    END
                    ELSE BEGIN
                        PRINT N'You are currently assigned to this course'
                    END
 
                    INSERT INTO practica1.Notification(UserId, Message, Date)
                        VALUES(@idUser, 'The tutor profile was assigned to the user', GETDATE())
					PRINT N'Notification is made'

                    INSERT INTO practica1.HistoryLog(Date, Description)
                        VALUES (GETDATE(), 'Transaction 2 finished successfully')
					PRINT N'Creating log record...'
                END
                ELSE BEGIN
                    INSERT INTO practica1.HistoryLog(Date, Description)
                        VALUES (GETDATE(), 'Transaction 2 failed, user not active')
					PRINT N'[Error] User not active'
                END
            END
            ELSE BEGIN
                INSERT INTO practica1.HistoryLog(Date, Description)
                        VALUES (GETDATE(), 'Transaction 2 failed, user does not exist')
				PRINT N'[Error] User does not exist'
            END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT N'[Error] transaction failed'
        ROLLBACK TRANSACTION
    END CATCH
END
-- -----------------------------------------------------------------------------------------------------}
USE BD2;
GO
CREATE PROCEDURE TR3
	@email nvarchar(max), 
	@codCourse int
AS
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY	
			IF @email = (SELECT [Email] FROM [BD2].[practica1].[Usuarios] WHERE [Email] = @email AND [EmailConfirmed] = 1)
				BEGIN
					IF (SELECT [CreditsRequired] FROM [BD2].[practica1].[Course] WHERE [CodCourse] = @codCourse) <= (SELECT [Credits] FROM [BD2].[practica1].[ProfileStudent], [BD2].[practica1].[Usuarios] WHERE [BD2].[practica1].[ProfileStudent].[UserId] = [BD2].[practica1].[UsuarioS].[Id] AND [BD2].[practica1].[Usuarios].[Email] = @email) 
						BEGIN
							DECLARE @idUsuario uniqueidentifier = (SELECT [Id] FROM [BD2].[practica1].[Usuarios] WHERE [Email] = @email)
							DECLARE @idUsuarioTutor uniqueidentifier = (SELECT [TutorId] FROM [BD2].[practica1].[CourseTutor] WHERE [CourseCodCourse] = @codCourse)

							PRINT N'Insert in CourseAssignment...'
							INSERT INTO [practica1].[CourseAssignment]
								   ([StudentId]
								   ,[CourseCodCourse])
							 VALUES
								   (@idUsuario
								   ,@codCourse)
					

							PRINT N' Insert in Notification...'
							INSERT INTO [practica1].[Notification]
								   ([UserId]
								   ,[Message]
								   ,[Date])
							 VALUES
								   (@idUsuario
								   ,' Assignment Successfully Made'
								   ,GETDATE())

							INSERT INTO [practica1].[Notification]
								   ([UserId]
								   ,[Message]
								   ,[Date])
							 VALUES
								   (@idUsuarioTutor
								   ,'Successful Student Assignment'
								   ,GETDATE())

							INSERT INTO [BD2].[practica1].[HistoryLog] (Date, Description) VALUES (GETDATE(), 'Transaction 3 finished successfully')
						END
					ELSE
						BEGIN
							PRINT N'Insert in HistoryLog...'
							INSERT INTO [BD2].[practica1].[HistoryLog] (Date, Description) VALUES (GETDATE(), 'No se tiene los creditos necesarios')
						END
				END
			ELSE
				BEGIN
					
					PRINT N'Insert in HistoryLog...'
					INSERT INTO [BD2].[practica1].[HistoryLog] (Date, Description) VALUES (GETDATE(), 'No cumple las condiciones')
				END
			
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH

			declare @error int, @message varchar(4000), @xstate int;
			select @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
			INSERT INTO [BD2].[practica1].[HistoryLog]
				([Date]
				 ,[Description])
			VALUES
				(GETDATE()
				,@message)
			rollback transaction p12;
			raiserror ('usp_my_procedure_name: %d: %s', 16, 1, @error, @message) ;
				
		END CATCH
END
-- -------------------------------------------------------------------------------------------------------------
USE BD2;
GO
CREATE PROCEDURE TR4
    @email          VARCHAR(50)
AS
BEGIN
	UPDATE practica1.Usuarios SET EmailConfirmed=1 WHERE email=@email
	PRINT N' Valid email...'
END