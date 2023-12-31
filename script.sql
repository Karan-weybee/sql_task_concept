USE [master]
GO
/****** Object:  Database [course]    Script Date: 9/20/2023 1:02:44 PM ******/
CREATE DATABASE [course]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'course', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\course.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'course_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [course] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [course].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [course] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [course] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [course] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [course] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [course] SET ARITHABORT OFF 
GO
ALTER DATABASE [course] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [course] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [course] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [course] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [course] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [course] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [course] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [course] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [course] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [course] SET  DISABLE_BROKER 
GO
ALTER DATABASE [course] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [course] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [course] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [course] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [course] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [course] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [course] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [course] SET RECOVERY FULL 
GO
ALTER DATABASE [course] SET  MULTI_USER 
GO
ALTER DATABASE [course] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [course] SET DB_CHAINING OFF 
GO
ALTER DATABASE [course] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [course] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [course] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [course] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'course', N'ON'
GO
ALTER DATABASE [course] SET QUERY_STORE = OFF
GO
USE [course]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[Customer_ID] [varchar](255) NOT NULL,
	[Customer_Name] [varchar](255) NULL,
	[Street_Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[Phone_Number] [varchar](10) NULL,
	[Credit_card_Number] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_DETAILS]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_DETAILS](
	[Order_ID] [decimal](10, 2) NOT NULL,
	[Customer_ID] [varchar](255) NULL,
	[ShIpping_type] [varchar](255) NULL,
	[Date_of_Purchase] [date] NULL,
	[Shopping_Cart_Id] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Customer_details]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Customer_details] as 
select customer.Customer_Name,customer.Street_Address,ORDER_DETAILS.* from customer inner join ORDER_DETAILS on customer.Customer_ID=ORDER_DETAILS.Customer_ID
GO
/****** Object:  Table [dbo].[AUTHOR]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHOR](
	[Author_ID] [varchar](255) NOT NULL,
	[Author_Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOKS]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKS](
	[Book_ID] [varchar](255) NOT NULL,
	[Book_Name] [varchar](255) NULL,
	[Author_ID] [varchar](255) NULL,
	[Price] [decimal](10, 2) NULL,
	[Publisher_ID] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CREDIT_CARD_DETAILS]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CREDIT_CARD_DETAILS](
	[Credit_Card_Number] [varchar](50) NOT NULL,
	[Credit_Card_type] [varchar](255) NULL,
	[Expiry_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Credit_Card_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUBLISHER]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISHER](
	[Publisher_id] [varchar](255) NOT NULL,
	[Publisher_Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_history]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_history](
	[customer_id] [varchar](255) NULL,
	[order_id] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_type]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_type](
	[Shipping_type] [varchar](255) NOT NULL,
	[Shipping_Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Shipping_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_cart]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_cart](
	[Shopping_Cart_ID] [decimal](10, 2) NOT NULL,
	[Book_ID] [varchar](255) NULL,
	[Price] [decimal](10, 2) NULL,
	[Date] [date] NULL,
	[Quantity] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Shopping_Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BOOKS]  WITH CHECK ADD FOREIGN KEY([Author_ID])
REFERENCES [dbo].[AUTHOR] ([Author_ID])
GO
ALTER TABLE [dbo].[BOOKS]  WITH CHECK ADD FOREIGN KEY([Publisher_ID])
REFERENCES [dbo].[PUBLISHER] ([Publisher_id])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([Credit_card_Number])
REFERENCES [dbo].[CREDIT_CARD_DETAILS] ([Credit_Card_Number])
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([ShIpping_type])
REFERENCES [dbo].[shipping_type] ([Shipping_type])
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([Shopping_Cart_Id])
REFERENCES [dbo].[Shopping_cart] ([Shopping_Cart_ID])
GO
ALTER TABLE [dbo].[purchase_history]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[purchase_history]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[ORDER_DETAILS] ([Order_ID])
GO
ALTER TABLE [dbo].[Shopping_cart]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[BOOKS] ([Book_ID])
GO
/****** Object:  StoredProcedure [dbo].[addAuthor]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addAuthor] (
@author_Id varchar(255),
@author_name varchar(255)
)
as 
begin
insert into author values (@author_Id,@author_name)
end;
GO
/****** Object:  StoredProcedure [dbo].[addbooks]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addbooks] (
@book_Id varchar(255),
@book_name varchar(255),
@author_id varchar(255),
@price decimal(10,2),
@publisher_id varchar(255)
)
as 
begin
insert into books values (@book_id,@book_name,@author_Id,@price,@publisher_id)
end;
GO
/****** Object:  StoredProcedure [dbo].[addCREDIT_CARD_DETAILS]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addCREDIT_CARD_DETAILS] (
@credit_card_Number varchar(50),
@Credit_card_type varchar(255),
@expiry_Date date
)
as 
begin
insert into CREDIT_CARD_DETAILS values (@credit_card_Number,@Credit_card_type,@expiry_Date)
end;
GO
/****** Object:  StoredProcedure [dbo].[addCustomer]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addCustomer] (
@customer_id varchar(255),
@customer_name varchar(255),
@street_address varchar(255),
@city varchar(255),
@phone_number varchar(10),
@credit_card_number varchar(50)
)
as 
begin
insert into customer values (@customer_id,@customer_name,@street_address,@city ,@phone_number,@credit_card_number)
end;
GO
/****** Object:  StoredProcedure [dbo].[addORDER_DETAILS]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addORDER_DETAILS] (
@order_id decimal(10,2),
@customer_id varchar(255),
@shipping_type varchar(255),
@date date,
@shopping_card_id decimal(10,2)
)
as 
begin
insert into ORDER_DETAILS values (@order_id,@customer_id,@shipping_type,@date ,@shopping_card_id)
end;
GO
/****** Object:  StoredProcedure [dbo].[addpublisher]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addpublisher] (
@publisher_id varchar(255),
@publisher_name varchar(255)
)
as 
begin
insert into publisher values (@publisher_id,@publisher_name )
end;
GO
/****** Object:  StoredProcedure [dbo].[addPURCHASE_HISTORY]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addPURCHASE_HISTORY] (
@customer_id varchar(255),
@order_id decimal(10,2)
)
as 
begin
insert into PURCHASE_HISTORY values (@customer_id,@order_id);
end;
GO
/****** Object:  StoredProcedure [dbo].[addshipping_type]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addshipping_type] (
@shipping_type varchar(255),
@shipping_price decimal(10,2)
)
as 
begin
insert into shipping_type values (@shipping_type,@shipping_price);
end;
GO
/****** Object:  StoredProcedure [dbo].[addShopping_cart]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addShopping_cart] (
@shopping_card_id decimal(10,2),
@book_id varchar(255),
@price decimal(10,2),
@date date,
@quantity decimal(10,2)
)
as 
begin
insert into Shopping_cart values (@shopping_card_id,@book_id,@price,@date,@quantity);
end;
GO
/****** Object:  StoredProcedure [dbo].[purchase_book]    Script Date: 9/20/2023 1:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[purchase_book] 
as
begin

select customer.Customer_Name,customer.Customer_ID,Shopping_cart.Book_ID,ORDER_DETAILS.Date_of_Purchase,ORDER_DETAILS.Shopping_Cart_Id from customer
inner join ORDER_DETAILS on customer.Customer_ID=ORDER_DETAILS.Customer_ID 
inner join Shopping_cart on ORDER_DETAILS.Shopping_Cart_Id = Shopping_cart.Shopping_Cart_ID
end;
GO
USE [master]
GO
ALTER DATABASE [course] SET  READ_WRITE 
GO
