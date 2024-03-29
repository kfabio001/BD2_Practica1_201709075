/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [BD2]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE DATABASE [BD2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\BD2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\BD2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD2] SET RECOVERY FULL 
GO
ALTER DATABASE [BD2] SET  MULTI_USER 
GO
ALTER DATABASE [BD2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD2] SET QUERY_STORE = OFF
GO
USE [BD2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BD2]
GO
/****** Object:  Schema [practica1]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE SCHEMA [practica1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Course]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Course](
	[CodCourse] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreditsRequired] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CodCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[CourseAssignment]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[CourseAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [uniqueidentifier] NOT NULL,
	[CourseCodCourse] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[CourseTutor]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[CourseTutor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TutorId] [uniqueidentifier] NOT NULL,
	[CourseCodCourse] [int] NOT NULL,
 CONSTRAINT [PK_CourseTutor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[HistoryLog]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[HistoryLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_HistoryLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Notification]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[ProfileStudent]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[ProfileStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_ProfileStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Roles]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[TFA]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[TFA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Status] [bit] NOT NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TFA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[TutorProfile]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[TutorProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TutorCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TutorProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[UsuarioRole]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[UsuarioRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsLatestVersion] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Usuarios]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Usuarios](
	[Id] [uniqueidentifier] NOT NULL,
	[Firstname] [nvarchar](max) NOT NULL,
	[Lastname] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[LastChanges] [datetime2](7) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseAssignment_CourseCodCourse]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseAssignment_CourseCodCourse] ON [practica1].[CourseAssignment]
(
	[CourseCodCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseAssignment_StudentId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseAssignment_StudentId] ON [practica1].[CourseAssignment]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseTutor_CourseCodCourse]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseTutor_CourseCodCourse] ON [practica1].[CourseTutor]
(
	[CourseCodCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseTutor_TutorId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseTutor_TutorId] ON [practica1].[CourseTutor]
(
	[TutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_UserId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_UserId] ON [practica1].[Notification]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProfileStudent_UserId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProfileStudent_UserId] ON [practica1].[ProfileStudent]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TFA_UserId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_TFA_UserId] ON [practica1].[TFA]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TutorProfile_UserId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_TutorProfile_UserId] ON [practica1].[TutorProfile]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsuarioRole_RoleId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsuarioRole_RoleId] ON [practica1].[UsuarioRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsuarioRole_UserId]    Script Date: 03/05/2022 8:02:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsuarioRole_UserId] ON [practica1].[UsuarioRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [practica1].[CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignment_Course_CourseCodCourse] FOREIGN KEY([CourseCodCourse])
REFERENCES [practica1].[Course] ([CodCourse])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseAssignment] CHECK CONSTRAINT [FK_CourseAssignment_Course_CourseCodCourse]
GO
ALTER TABLE [practica1].[CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignment_Usuarios_StudentId] FOREIGN KEY([StudentId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseAssignment] CHECK CONSTRAINT [FK_CourseAssignment_Usuarios_StudentId]
GO
ALTER TABLE [practica1].[CourseTutor]  WITH CHECK ADD  CONSTRAINT [FK_CourseTutor_Course_CourseCodCourse] FOREIGN KEY([CourseCodCourse])
REFERENCES [practica1].[Course] ([CodCourse])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseTutor] CHECK CONSTRAINT [FK_CourseTutor_Course_CourseCodCourse]
GO
ALTER TABLE [practica1].[CourseTutor]  WITH CHECK ADD  CONSTRAINT [FK_CourseTutor_Usuarios_TutorId] FOREIGN KEY([TutorId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseTutor] CHECK CONSTRAINT [FK_CourseTutor_Usuarios_TutorId]
GO
ALTER TABLE [practica1].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[Notification] CHECK CONSTRAINT [FK_Notification_Usuarios_UserId]
GO
ALTER TABLE [practica1].[ProfileStudent]  WITH CHECK ADD  CONSTRAINT [FK_ProfileStudent_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[ProfileStudent] CHECK CONSTRAINT [FK_ProfileStudent_Usuarios_UserId]
GO
ALTER TABLE [practica1].[TFA]  WITH CHECK ADD  CONSTRAINT [FK_TFA_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[TFA] CHECK CONSTRAINT [FK_TFA_Usuarios_UserId]
GO
ALTER TABLE [practica1].[TutorProfile]  WITH CHECK ADD  CONSTRAINT [FK_TutorProfile_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[TutorProfile] CHECK CONSTRAINT [FK_TutorProfile_Usuarios_UserId]
GO
ALTER TABLE [practica1].[UsuarioRole]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRole_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [practica1].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[UsuarioRole] CHECK CONSTRAINT [FK_UsuarioRole_Roles_RoleId]
GO
ALTER TABLE [practica1].[UsuarioRole]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRole_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[UsuarioRole] CHECK CONSTRAINT [FK_UsuarioRole_Usuarios_UserId]
GO
/****** Object:  StoredProcedure [dbo].[TR1]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TR1]
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

GO
/****** Object:  StoredProcedure [dbo].[TR2]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TR2]
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
GO
/****** Object:  StoredProcedure [dbo].[TR3]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TR3]
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
GO
/****** Object:  StoredProcedure [dbo].[TR4]    Script Date: 03/05/2022 8:02:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TR4]
    @email          VARCHAR(50)
AS
BEGIN
	UPDATE practica1.Usuarios SET EmailConfirmed=1 WHERE email=@email
	PRINT N' Valid email...'
END
GO
USE [master]
GO
ALTER DATABASE [BD2] SET  READ_WRITE 
GO
