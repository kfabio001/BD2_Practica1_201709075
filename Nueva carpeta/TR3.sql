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
