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