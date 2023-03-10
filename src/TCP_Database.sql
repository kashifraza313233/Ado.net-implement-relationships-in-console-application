USE [master]
GO
/****** Object:  Database [TeacherCollegeProfile]    Script Date: 1/20/2023 11:08:25 PM ******/
CREATE DATABASE [TeacherCollegeProfile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeacherCollegeProfile', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\TeacherCollegeProfile.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeacherCollegeProfile_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\TeacherCollegeProfile_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TeacherCollegeProfile] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeacherCollegeProfile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeacherCollegeProfile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeacherCollegeProfile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeacherCollegeProfile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeacherCollegeProfile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeacherCollegeProfile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeacherCollegeProfile] SET  MULTI_USER 
GO
ALTER DATABASE [TeacherCollegeProfile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeacherCollegeProfile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeacherCollegeProfile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeacherCollegeProfile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeacherCollegeProfile] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeacherCollegeProfile] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TeacherCollegeProfile] SET QUERY_STORE = OFF
GO
USE [TeacherCollegeProfile]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 1/20/2023 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TId] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](100) NULL,
	[Last_Name] [varchar](100) NULL,
	[Gender] [varchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[EmailAddress] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRecord]    Script Date: 1/20/2023 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllRecord]
as
begin
select TId,First_Name,Last_Name,Gender,ContactNo,EmailAddress,City,Address from Teacher with(nolock)
end
GO
/****** Object:  StoredProcedure [dbo].[GetRecordsbyId]    Script Date: 1/20/2023 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRecordsbyId]
(
@TId int
)
as
begin
      Select [TId]
	        ,[First_Name]
            ,[Last_Name]
            ,[Gender]
            ,[ContactNo]
            ,[EmailAddress]
            ,[City]
           ,[Address]
      FROM [TeacherCollegeProfile].[dbo].[Teacher]
	  where @TId=TId
End
GO
/****** Object:  StoredProcedure [dbo].[TCP]    Script Date: 1/20/2023 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TCP](

@First_Name varchar(100),@Last_Name varchar(100),@Gender varchar(50),@ContactNo nvarchar(50),
@EmailAddress varchar(100),@City varchar(50),@Address varchar(50) 
)
as
begin
     begin try
		 begin tran
			  insert into Teacher (First_Name,Last_Name,Gender,ContactNo,EmailAddress,City,Address)
			  values(@First_Name,@Last_Name,@Gender,@ContactNo,@EmailAddress,@City,@Address)
		 commit tran
	 end try
begin catch
	    rollback tran
		select ERROR_MESSAGE()
end catch	 
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateRecords]    Script Date: 1/20/2023 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateRecords](

@TId int,
@First_Name varchar(100),@Last_Name varchar(100),@Gender varchar(50),@ContactNo nvarchar(50),
@EmailAddress varchar(100),@City varchar(50),@Address varchar(50) 
)
as
begin
     begin try
		 begin tran
			  update Teacher 
			  set 
			  @First_Name=First_Name,
			  @Last_Name=Last_Name,
			  @Gender=Gender,
			  @ContactNo=ContactNo,
			  @EmailAddress=EmailAddress,
			  @City=City,
			  @Address=Address
			 where  @TId = TId

		 commit tran
	 end try
begin catch
	    rollback tran
		select ERROR_MESSAGE()
end catch	 
end
GO
USE [master]
GO
ALTER DATABASE [TeacherCollegeProfile] SET  READ_WRITE 
GO
