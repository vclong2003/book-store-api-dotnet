/****** Object:  Database [1670_db]    Script Date: 23/06/15 10:57:27 ******/
CREATE DATABASE [1670_db]  (EDITION = 'Free', SERVICE_OBJECTIVE = 'Free', MAXSIZE = 32 MB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [1670_db] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [1670_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [1670_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [1670_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [1670_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [1670_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [1670_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [1670_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [1670_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [1670_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [1670_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [1670_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [1670_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [1670_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [1670_db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [1670_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [1670_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [1670_db] SET  MULTI_USER 
GO
ALTER DATABASE [1670_db] SET ENCRYPTION ON
GO
ALTER DATABASE [1670_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [1670_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23/06/15 10:57:28 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[ProductId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ProductId] [int] NOT NULL,
	[OrderId] [nvarchar](450) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [nvarchar](450) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShippingAddressId] [int] NULL,
	[StaffId] [int] NULL,
	[Date] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[PaymentMethod] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ThumbnailUrl] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Publisher] [nvarchar](max) NULL,
	[PublishcationDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddresses]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShippingAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 23/06/15 10:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602104454_AddressCustomer', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604073311_UpdateOrderModel', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604073342_UpdateOrderModel2', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604095627_order', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604184733_orderRegExp', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230612194609_AddressCustomerNullable', N'7.0.5')
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (1, N'vclong2003@gmail.com', N'$2a$11$TBPOvnj6ZqMjlNNUJ86KeujIOAbYwcPZJplHlYDBp3VzeK7dkEkSG', N'MANAGER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (2, N'test@gmail.com', N'$2a$11$iaYlDPkfb8JKebKTbiJiaekiXF7BMPPw0.jgqnWJyYuqlPGmvJw5.', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (3, N'staff@gmail.com', N'$2a$11$m7jMnshGarzT/gkJI7oxAeTsFf4QPTgALY2WlhdLsgkWNn.aeKeUS', N'STAFF')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (6, N'staff1@gmail.com', N'$2a$11$4g6tyoZKZ/tPtCj7YrGVZe7mrE8yJ9mWkBH4u0UFNT5KSxY.JLTQu', N'STAFF')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (7, N'test1@gmail.com', N'$2a$11$h8zIBiQFRmr05XlpyXEcfeDRr3qRPjri.J5vatrCpD6w/2kNRaGN.', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (9, N'Minh@gmail.com', N'$2a$11$T5D6WAhjKg7ujxrgiP9IBelGTzKuzs48bE6squVwkdAnD3Nvka.j6', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (12, N'haha@gmail.com', N'$2a$11$wGSewm3CQxkoijgWXBR/tuifAYuT7rQt0SEMeH7BwyN3WUQZ6Gdry', N'STAFF')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (13, N'staffNew@gmail.com', N'$2a$11$O7b69LQMU6NPpCRzNcwquOVG.Ck0PEyO2Nubi.GkAHmBMz9/dkou6', N'STAFF')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (14, N'minhbeo@gmalfd.com', N'$2a$11$.jK0CyJ40vrj2IMD27Qjk.rmGBq50pHsSzbChpeB/becTRxt8PjcC', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (15, N'abc@gmail.com', N'$2a$11$MkO/xjXsDbH8VlRqpjY6pOpQsNIK9yGl5dW5HV1J7z0onPo6mmKQW', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (16, N'sadasd@gmail.com', N'$2a$11$ZGMJCVann0OmUuE/wvTsMuaWBqinMh2Yj7fHGRtWG.Ll/NSzLFWAS', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (17, N'qweqweq@gm.c', N'$2a$11$WasO1BJw0MH4jhPn4N/Mo.jvfU1KtTvJB1Vgfc97nMw2vVRaPi9h.', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (18, N'hungoccho@gmail.com', N'$2a$11$Vr8vDTsJ.3fAEw129pHC1.6.5wRfYf1EWDo.b/V4goN6dYArK8J7e', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (19, N'abcd@gmail.com', N'$2a$11$SD3VxT.urWNZmg8bhDHIX.gxGxvvQCjzzjeB8teTds7qpi33HjGOm', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (20, N'123@gas', N'$2a$11$HI.Fn/QJSZ0nz3LQy5lmI.WuL.vKieG2gVv77MpJOJh1eqaRaNbsC', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (21, N'trantanminh0603@gmail.com', N'$2a$11$3uj2FouPYXd1zolYT4hI/eIXdk/lA9hSeJyqYoNXDJ4iXNkfzCRTq', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (22, N'abc123@gmail.com', N'$2a$11$aO6pKHUKZz3y3rMG6I9C0uLX9xoDdUGupNCVvBkdDZkNkiAHMiXdi', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (23, N'thang@gmail.com', N'$2a$11$UZl1/.R.TZzVCPeEh56K9uhV4/YHG/MVdHswEKTEYhtpjud4qHj6O', N'CUSTOMER')
INSERT [dbo].[Accounts] ([Id], [Email], [Password], [Role]) VALUES (24, N'toilavcl@gmail.com', N'$2a$11$4Z.Ng/dky1vFfsRVc.GbGuy3E0ic6MRlxVT1XyeKWIjUY6EP9bqUa', N'CUSTOMER')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
INSERT [dbo].[CartItems] ([CustomerId], [ProductId], [Quantity]) VALUES (16, 32, 15)
INSERT [dbo].[CartItems] ([CustomerId], [ProductId], [Quantity]) VALUES (17, 29, 1)
INSERT [dbo].[CartItems] ([CustomerId], [ProductId], [Quantity]) VALUES (17, 30, 1)
INSERT [dbo].[CartItems] ([CustomerId], [ProductId], [Quantity]) VALUES (17, 31, 1)
INSERT [dbo].[CartItems] ([CustomerId], [ProductId], [Quantity]) VALUES (17, 38, 1)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Literature', N'Literature is a term used to describe written or spoken material. According to the Oxford Dictionary, literature is defined as “written works, especially those considered of superior or lasting artistic merit”. Britannica defines literature as “a body of written works” and the name has traditionally been applied to those imaginative works of poetry and prose distinguished by the intentions of their authors and the perceived aesthetic excellence of their execution ')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Novel', N' A novel is a work of extended fictional prose narrative that typically explores characters, events, and settings in a complex and detailed manner. It is a literary genre that allows for a more extensive and in-depth exploration of themes, plotlines, and characters than shorter forms of fiction, such as short stories or novellas. Novels are often characterized by their length, which can range from tens of thousands to hundreds of thousands of words, and their ability to provide a comprehensive and immersive reading experience.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'Romance', N' A romance book is a genre of fiction that focuses primarily on a romantic relationship between two or more characters. It typically explores the development of a deep emotional connection, love, and often includes themes of passion, desire, and personal growth. Romance books are known for their emphasis on the emotional and romantic journey of the characters, and they often feature a happy ending or a satisfying resolution to the romantic conflict.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (4, N'Fiction', N'A fiction book is a work of literature that presents a narrative or story that is primarily imagined or invented by the author. It is a broad category that encompasses a wide range of genres and styles, including novels, short stories, novellas, and more. Fiction books are characterized by their use of imagination, creativity, and the portrayal of fictional characters and events.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (5, N'History', N' A history book is a written work that presents a factual account and interpretation of past events, people, and civilizations. It is a genre of non-fiction that seeks to provide a scholarly or informative narrative of historical events based on evidence, research, and analysis. History books aim to educate readers about the past and offer insights into how historical events have shaped the present.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (6, N'Self-help', N' A self-help book is a genre of literature that aims to provide guidance, advice, and strategies for personal development, self-improvement, and achieving specific goals. It is a form of non-fiction literature that focuses on empowering individuals to make positive changes in their lives, overcome challenges, and enhance their well-being.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (7, N' Mystery', N'A mystery book is a genre of fiction that revolves around the investigation and resolution of a puzzling or enigmatic event, often a crime. It typically involves a detective, amateur sleuth, or protagonist who sets out to uncover the truth behind a mysterious occurrence, such as a murder, theft, or disappearance. Mystery books are known for their suspenseful plots, twists and turns, and the challenge of solving the puzzle before the resolution is revealed.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (8, N'Politics', N' A politics book is a work of literature that focuses on the study, analysis, and discussion of political systems, institutions, ideologies, and policies. It is a genre of non-fiction that explores the dynamics of power, governance, and the relationship between individuals, society, and the state. Politics books aim to provide insights into political theory, historical events, current affairs, and the workings of governments.')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (16, N'Biography', N'Biography is a nonfiction account of a real person''s life written by someone else.')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'10f9aa32-8689-4562-a177-f08ae59a7e8a', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'17997183-a8e4-49a2-aed7-079ec00eea60', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'1966aea7-825a-454d-8ec1-7a8e41dd7e17', 2)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'93b4ecd3-5639-46b9-b237-8b53ae503326', 3)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'a97d1602-5560-4fb1-b465-47eb950ea675', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'db319f5d-575d-4eeb-aabb-4111d4f28c55', 2)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'f14ae6c2-5855-4ffb-bde0-bb5a20359ead', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (28, N'ff2a7ac8-fb82-4650-a627-544ddea0f58a', 2)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'17997183-a8e4-49a2-aed7-079ec00eea60', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'1966aea7-825a-454d-8ec1-7a8e41dd7e17', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'92aeea96-a027-4805-ab31-98a28cb646ab', 3)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'93b4ecd3-5639-46b9-b237-8b53ae503326', 2)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'a97d1602-5560-4fb1-b465-47eb950ea675', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'db319f5d-575d-4eeb-aabb-4111d4f28c55', 4)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'f2a7ebef-4eaf-4628-a372-5c3d8b46b6a8', 5)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (29, N'ff2a7ac8-fb82-4650-a627-544ddea0f58a', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (30, N'4401dc53-8df4-4a68-bbb8-abe481a1995a', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (31, N'f14ae6c2-5855-4ffb-bde0-bb5a20359ead', 10)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (32, N'403d7ef7-28be-4bcd-92ec-d2be8ddc9710', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (32, N'4c05a2da-9e4d-4d12-a6a2-8408ad4dda28', 4)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (33, N'4401dc53-8df4-4a68-bbb8-abe481a1995a', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (35, N'4c05a2da-9e4d-4d12-a6a2-8408ad4dda28', 4)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (35, N'7473674a-f483-4183-9ac9-48df3dc8ae66', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (35, N'd3c8da48-962f-4c82-a82a-75a3a6bc91b3', 2)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (41, N'720e2fbd-6059-430e-9bd9-fdeaf099141c', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (43, N'493184fe-2a4e-4f01-acf4-b54c9f2805a1', 6)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (43, N'f6f3ec31-c531-4e4f-9c54-37da9aea1eee', 6)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (46, N'f6f3ec31-c531-4e4f-9c54-37da9aea1eee', 1)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (47, N'292500f8-7b50-441d-9f91-b90277567189', 24)
INSERT [dbo].[OrderItems] ([ProductId], [OrderId], [Quantity]) VALUES (51, N'a8e4055f-c15b-4929-8f80-55201bdaccb9', 10)
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'10f9aa32-8689-4562-a177-f08ae59a7e8a', 2, 11, 1, CAST(N'2023-05-05T00:00:00.0000000' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'17997183-a8e4-49a2-aed7-079ec00eea60', 2, 9, 1, CAST(N'2023-04-12T16:21:06.8630421' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'1966aea7-825a-454d-8ec1-7a8e41dd7e17', 2, 11, 1, CAST(N'2023-04-06T16:01:23.9207867' AS DateTime2), N'Cancelled', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'292500f8-7b50-441d-9f91-b90277567189', 23, 22, 1, CAST(N'2023-06-13T07:27:06.4986723' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'403d7ef7-28be-4bcd-92ec-d2be8ddc9710', 15, 15, 1, CAST(N'2023-04-13T03:37:33.1194953' AS DateTime2), N'Delivered', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'4401dc53-8df4-4a68-bbb8-abe481a1995a', 7, 12, 4, CAST(N'2023-06-13T14:06:57.5062911' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'493184fe-2a4e-4f01-acf4-b54c9f2805a1', 22, 20, 4, CAST(N'2023-05-13T05:56:00.5530866' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'4c05a2da-9e4d-4d12-a6a2-8408ad4dda28', 19, 18, 1, CAST(N'2023-05-13T04:08:05.7470229' AS DateTime2), N'Cancelled', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'720e2fbd-6059-430e-9bd9-fdeaf099141c', 18, 17, 1, CAST(N'2023-05-13T04:04:48.3851547' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'7473674a-f483-4183-9ac9-48df3dc8ae66', 16, 16, 1, CAST(N'2023-06-13T04:04:19.1460751' AS DateTime2), N'Delivered', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'92aeea96-a027-4805-ab31-98a28cb646ab', 2, 11, 1, CAST(N'2023-04-05T00:00:00.0000000' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'93b4ecd3-5639-46b9-b237-8b53ae503326', 2, 10, 1, CAST(N'2023-06-08T04:40:09.7006361' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'a8e4055f-c15b-4929-8f80-55201bdaccb9', 24, 23, 1, CAST(N'2023-06-14T05:47:51.3594397' AS DateTime2), N'Cancelled', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'a97d1602-5560-4fb1-b465-47eb950ea675', 2, 9, 1, CAST(N'2023-06-12T16:06:24.1198872' AS DateTime2), N'Cancelled', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'd3c8da48-962f-4c82-a82a-75a3a6bc91b3', 15, 21, 4, CAST(N'2023-06-13T06:11:55.1943338' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'db319f5d-575d-4eeb-aabb-4111d4f28c55', 2, 9, 1, CAST(N'2023-06-06T14:55:12.4332659' AS DateTime2), N'Delivered', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'f14ae6c2-5855-4ffb-bde0-bb5a20359ead', 2, 10, 1, CAST(N'2023-06-06T15:19:14.9669255' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'f2a7ebef-4eaf-4628-a372-5c3d8b46b6a8', 2, 11, 1, CAST(N'2023-03-03T00:00:00.0000000' AS DateTime2), N'Delivered', N'Bank transfer')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'f6f3ec31-c531-4e4f-9c54-37da9aea1eee', 2, 10, 1, CAST(N'2023-06-15T02:51:37.7505849' AS DateTime2), N'Delivering', N'Pay when received')
INSERT [dbo].[Orders] ([Id], [CustomerId], [ShippingAddressId], [StaffId], [Date], [Status], [PaymentMethod]) VALUES (N'ff2a7ac8-fb82-4650-a627-544ddea0f58a', 7, 12, 4, CAST(N'2023-06-12T10:29:21.2992489' AS DateTime2), N'Delivered', N'Pay when received')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (28, 7, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Feeb8c73f-9722-448d-a09c-30898010f031%2F51KMnIaZSwS._SY498_BO1%2C204%2C203%2C200_.jpg?alt=media&token=461940df-669a-4f3a-a8b1-46896a5c5271', N'The Sherlock Holmes Collection: Deluxe 6-Volume Box Set Edition (Arcturus Collector''s Classics)', N'Arthur Conan Doyle', N'Arcturus', CAST(N'2017-09-01T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">This tastefully produced box set collects Arthur Conan Doyle''s Sherlock Holmes stories in six volumes. The drug-addled, anti-social sleuth has become one of the most iconic characters in fiction and the tales collected here will entertain readers today just as much as when they were first published in the late 19th Century. Stories include: 1. Adventures of Sherlock Holmes 2. The Hound of the Baskervilles &amp; The Valley of Fear 3. His Last Bow 4. The Memoirs of Sherlock Holmes 5. The Return of Sherlock Holmes 6. A Study in Scarlet &amp; The Sign of Four</span></p>', 39.99, 99)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (29, 16, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fbaac720d-79c8-4864-b35a-dc4777f6f9b1%2F31C1MBz%2BARL._SX328_BO1%2C204%2C203%2C200_.jpg?alt=media&token=810eada4-851a-4068-81d7-22b6a6976ba3', N'Steve Jobs', N'Walter Isaacson', N'Amazon', CAST(N'2021-10-04T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Based on more than forty interviews with Steve Jobs conducted over two years—as well as interviews with more than 100 family members, friends, adversaries, competitors, and colleagues—Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.</span></p>', 15.59, 1000)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (30, 16, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F93285a97-073a-4c89-9b08-bd7444a01f94%2F51G5GVmXk%2BL._SX418_BO1%2C204%2C203%2C200_.jpg?alt=media&token=9f9083c5-6e2c-429a-9f2a-f1939f1ce1ab', N'The Beatles', N'Judy Katschke', N'Amazon', CAST(N'2023-05-31T00:00:00.0000000' AS DateTime2), N'<p><strong style="color: rgb(15, 17, 17);">Help your little one dream big with a Little Golden Book biography</strong></p><p><strong style="color: rgb(15, 17, 17);">about one of the greatest bands of all time—The Beatles! Little Golden Book biographies are the perfect introduction to nonfiction for preschoolers!</strong></p>', 5.99, 99)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (31, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fc222ab3c-fba3-49a2-9f7c-e0d2e2a90bc0%2F4186G21HSsL._SX314_BO1%2C204%2C203%2C200_.jpg?alt=media&token=aca60e9a-1f54-4db5-9056-b638a7c62238', N'The Theory Of Everything', N' Stephen W Hawking', N'Jaico Publishing House', CAST(N'2006-06-03T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Stephen Hawking''s ability to make science understandable and compelling to a lay audience was established with the publication of his first book, A Brief History of Time, which has sold nearly 10 million copies in 40 languages. Hawking has authored or participated in the creation of numerous other popular science books, including The Universe in a Nutshell, A Briefer History of Time, On the Shoulders of Giants, The Illustrated On the Shoulders of Giants, and George''s Secret Key to the Universe.</span></p>', 14, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (32, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F353ae491-9dd7-4b41-8047-1df56214221b%2F1505921104.01._SCLZZZZZZZ_SX500_.jpg?alt=media&token=d36626bb-b60e-42b9-b19d-90fc5e9a8117', N'Chí Phèo', N'Nam Cao', N'Phan Lac Dan', CAST(N'1941-06-14T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Nam Cao''s famous Chi Pheo story translated to poem by Phan Lac Dan &amp; Pham Ngoc Tho</span></p>', 4.85, 99)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (33, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fcb9533e0-be25-4996-9714-839732f3361e%2F510R2firxrL.jpg?alt=media&token=983ea9f9-18a5-485b-8bb1-0ad3c510694d', N'GIRL IN A RABBIT HOLE', N'RJ Law ', N'Amazon', CAST(N'2021-05-06T00:00:00.0000000' AS DateTime2), N'<p><em style="color: rgb(15, 17, 17);">This time ... they may have messed with&nbsp;</em><strong style="color: rgb(15, 17, 17);"><em>the wrong woman</em></strong><span style="color: rgb(15, 17, 17);">.</span></p><p><br></p><p><strong style="color: rgb(15, 17, 17);"><em>"ABSOLUTELY RIVETING."</em></strong></p><p><em style="color: rgb(15, 17, 17);">— Writing Axis</em></p><p><br></p><p><span style="color: rgb(15, 17, 17);">They are watching ... watching all the time ... watching Claire Foley with eager, covetous eyes.</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">They know all about her … her goals and her fears, how many cups of coffee she drinks in the morning, how long she brushes her teeth at night.</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">As she goes about her daily life, they plot in the shadows. Ways to rip her out of her life and bend her to their will. Ways to make her theirs …</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">… just like all the rest.</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">It will start with an offer she cannot refuse ... a threat she cannot ignore. It will end in a place of terror and secrets, where surprises lurk around every corner and friends and villains all look the same. — A place of terrifying dangers and stunning revelations ... a place of deeply disturbing mysteries and dark, chilling deeds.</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">They think they know everything about her ... every way to make her bend. But there’s one thing they don’t know ...</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">... this time they may have messed with the wrong person.</span></p><p><br></p><p><strong style="color: rgb(15, 17, 17);"><em>"Captivating, suspenseful and truly hard to put down."</em></strong><em style="color: rgb(15, 17, 17);">&nbsp;— Amazon Review</em></p><p><br></p><p><strong style="color: rgb(15, 17, 17);"><em>“AN ADDICTIVE, BINGE-WORTHY SERIES.”&nbsp;</em></strong><em style="color: rgb(15, 17, 17);">— Writing Axis</em></p><p><br></p><p><strong style="color: rgb(15, 17, 17);"><em>"I only read the first page and I was hooked."</em></strong><em style="color: rgb(15, 17, 17);">&nbsp;— Amazon Review</em></p>', 9.99, 99)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (34, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fc96ef643-a681-4517-9e7f-8a0d9d5f392f%2Flam-di.jpg?alt=media&token=034c83f7-d82d-489c-a951-10ecade7cb8a', N'Làm đĩ', N'Vũ Trọng Phụng', N'Vũ Trọng ', CAST(N'1937-06-07T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">After thirty years of being blacklisted, Vu''s works</span></p><p><span style="color: rgb(15, 17, 17);">Trong Phung has been quickly re-published in turn</span></p><p><span style="color: rgb(15, 17, 17);">It''s been seven years, only a few works are still missing</span></p><p><span style="color: rgb(15, 17, 17);">see the sunlight again in this book. Because</span></p><p><span style="color: rgb(15, 17, 17);">Just hearing the title of the book made many people scared.</span></p><p><span style="color: rgb(15, 17, 17);">But if you''re afraid, then you think it''s because people haven''t completely escaped</span></p><p><span style="color: rgb(15, 17, 17);">get the prejudice that since 1936 Thai Phi has caused: Van Vu</span></p><p><span style="color: rgb(15, 17, 17);">Trong Phung is "lewd literature"</span></p>', 9.99, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (35, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Ff4dbc925-f4bf-442e-8c0c-15cf3c206c1b%2F61JfTHkh7RL._SX344_BO1%2C204%2C203%2C200_.jpg?alt=media&token=f8eaf4b4-33fa-4cc8-b9cd-aa96572e089c', N'Những ngày thơ ấu', N'Nguyên Hồng', N'Nguyên ', CAST(N'1989-06-14T00:00:00.0000000' AS DateTime2), N'<p>Childhood days can be considered an excellent work of Vietnamese literature. This is a book of childhood memoirs recording the "extreme vibrations of a young soul".</p>', 10, 97)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (36, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F8a137b23-4ee8-47f2-9830-b5d77f7b9bf7%2F4161GwcH34L.jpg?alt=media&token=5d5b41b8-a4d7-4f17-ab0e-f8e864fe7dd4', N'The Girl Who Kicked the Hornet''s Nest', N'Stieg Larsson ', N'Random House', CAST(N'2010-05-24T00:00:00.0000000' AS DateTime2), N'<p><strong>Audie Awards Winner, 2010</strong></p><p><strong>The stunning third and final novel in Stieg Larsson’s internationally best-selling trilogy.</strong></p><p>Lisbeth Salander—the heart of Larsson’s two previous novels—lies in critical condition, a bullet wound to her head, in the intensive care unit of a Swedish city hospital. She’s fighting for her life in more ways than one: if and when she recovers, she’ll be taken back to Stockholm to stand trial for three murders. With the help of her friend, journalist Mikael Blomkvist, she will not only have to prove her innocence, but also identify and denounce those in authority who have allowed the vulnerable, like herself, to suffer abuse and violence. And, on her own, she will plot revenge—against the man who tried to kill her, and the corrupt government institutions that very nearly destroyed her life.</p><p>Once upon a time, she was a victim. Now Salander is fighting back.</p>', 15, 98)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (37, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fa5f72fc9-b136-4515-8845-1bd726c27855%2FPicture2-1.jpg?alt=media&token=dadf8103-b8f7-44f6-b5f7-ed6a4bc0de35', N'Hà Nội 36 phố phường', N'Thạch Lam', N'Thach Lam', CAST(N'1943-06-14T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Né le 7 juillet 1910 dans une commune de Hanoi, Thach Lam commença dès 1931 sa carrière de journaliste. Il mourut de tuberculose le 6 juin 1942 au village de Yên Phụ, près du lac de l’Ouest.‘Hanoi aux trente-six quartiers’ est un recueil d’essais écrits à la va-vite à l’intention de la presse. L’ouvrage devint ainsi le premier récit-reportage sur Hanoi avec une façon inédite de parler de la nourriture, du plaisir de goûter aux bonnes choses comme une activité sociale empreinte de culture. A travers les descriptions de rues et de quartiers et de scènes de vie qui s’y déroulent, l’auteur dévoile le caractère des habitants de cette ville, leur mentalité voire leur psychologie. Thach Lam raconte, discute, critique, à mi-voix, parfois en élevant le ton, s’énervant à l’occasion… contre Hanoi même.</span></p>', 13, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (38, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F47f4fa0c-0be8-4486-a1ff-9eb15c92d8b7%2Fgtsachtoithayhoavangtrencoxanh.jpg?alt=media&token=67f31916-d691-4d55-a77d-2a64204e2e2b', N'Tôi thấy hoa vàng trên cỏ xanh', N'Nguyễn Nhật Ánh', N'Nguyen Anh', CAST(N'1999-06-15T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">This English translation of the bestselling Vietnamese novel by acclaimed author Nguyen Nhat Anh explores childhood and coming of age of teenagers in Vietnam. Its insights into friendship, love, and family are simultaneously unique and universal.</span></p><p><span style="color: rgb(15, 17, 17);">PRAISE for YELLOW FLOWERS IN THE GREEN GRASS--</span></p><p><span style="color: rgb(15, 17, 17);">--"I love YELLOW FLOWERS IN THE GREEN GRASS by Nguyen Nhat Anh, not only because of his excellent writing style and a compassionate open-ended story, but also because of the human love deeply expressed in each event, each character. His world of children is full of misdoings and awakening moments."--Prof. Dr. Le Huy Bac, Hanoi National University of Education, Vietnam</span></p><p><span style="color: rgb(15, 17, 17);">--"a heart-felt tale of family love, brotherhood, and friendships among teenagers." --Film director Victor Vu</span></p><p><span style="color: rgb(15, 17, 17);">--"Nguyen Nhat Anh, a revered and bestselling author in his native Vietnam, seems to have an innate understanding of childhood''s appeal." --Jason Beerman, journalist and art critic, THE TORONTO STAR</span></p>', 16, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (39, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F2e74b699-7408-4458-8c03-d98d4271ac08%2F41VauVkV7-L._SX311_BO1%2C204%2C203%2C200_.jpg?alt=media&token=9370bf66-d4ae-454f-820e-941f3e31d379', N'Tuổi thơ dữ dội', N'Phùng Quán', N'Phung ', CAST(N'2009-10-13T00:00:00.0000000' AS DateTime2), N'<p>Fierce Childhood - The story revolves around the struggles and sacrifices of 13- and 14-year-old teenagers in the ranks of the youth scouts of the Tran Cao Van regiment. The Luom, Mung, Quynh Son ca, Hoa Den, Cotton skin snake, Bay hump, Private ... Each person in a situation with the same determination, enthusiasm and patriotism, participated in the fight with all their heart and soul. died at a very young age. True to the title of the story, readers will find there really intense details about the unfortunate teenage life, about the cruel struggle against the enemy, but deep inside we can still see the pure and innocent souls. carefree, seeing the extraordinary courage and bravery of the character. Everyone who has read this work can hardly help but be moved and shed tears of sympathy and admiration. This is really a precious work in the Vietnamese literary treasure. A story that awakens in every person who loves his country and cherishes his childhood memories wholeheartedly... Reviews of the work: "... There is a precious time gem dedicated to prohibiting giving to people, that is. is childhood A magical pearl that is pure but too fragile to find a second time in life And there is a generation of Vietnamese who have never held a pearl in their hands Phung Quan''s fierce childhood was written for the next generation. Read to remember, to be proud, and to pray for the upcoming Childhood..." - Writer Hoang Phu Ngoc Tuong. Fierce Childhood - a story about a life of fighting life and the sacrifices of 13- and 14-year-old boys in the ranks of youth scouts of the Tran Cao Van regiment. The Luom, Mung, Quynh Son ca, Hoa Den, Cotton skin snake, Bay hump, Private ... Each person in a situation with the same determination, enthusiasm and patriotism, participated in the fight with all their heart and soul. died at a very young age. True to the title of the story, readers will find there really intense details about the unfortunate teenage life, about the cruel struggle against the enemy, but deep inside we can still see the pure and innocent souls. carefree, seeing the extraordinary courage and bravery of the character. Everyone who has read this work can hardly help but be moved and shed tears of sympathy and admiration. This is really a precious work in the Vietnamese literary treasure. A story that awakens in every person who loves his country and cherishes his childhood memories wholeheartedly... Reviews of the work: "... There is a precious time gem dedicated to prohibiting giving to people, that is. is childhood A magical pearl that is pure but too fragile to find a second time in life And there is a generation of Vietnamese who have never held a pearl in their hands Phung Quan''s fierce childhood was written for the next generation. Read it to remember, to be proud, and to pray for the upcoming Childhood..." - Writer Hoang Phu Ngoc Tuong.</p>', 16, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (40, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F2f1176e0-821c-49e4-8ac7-8c5d0647eae0%2F41PS2gx2tAL._SY291_BO1%2C204%2C203%2C200_QL40_FMwebp_.webp?alt=media&token=f6352737-8677-4da2-a2e6-ca9b5f651706', N'Số Đỏ', N'Vũ Trọng Phụng', N'Phung Vu', CAST(N'1936-06-14T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Banned in Vietnam until 1986,&nbsp;</span><em style="color: rgb(15, 17, 17);">Dumb Luck</em><span style="color: rgb(15, 17, 17);">--by the controversial and influential Vietnamese writer Vu Trong Phung--is a bitter satire of the rage for modernization in Vietnam during the late colonial era. First published in Hanoi during 1936, it follows the absurd and unexpected rise within colonial society of a street-smart vagabond named Red-haired Xuan. As it charts Xuan''s fantastic social ascent, the novel provides a panoramic view of late colonial urban social order, from the filthy sidewalks of Hanoi''s old commercial quarter to the gaudy mansions of the emergent Francophile northern upper classes. The transformation of traditional Vietnamese class and gender relations triggered by the growth of colonial capitalism represents a major theme of the novel.</span></p><p><em style="color: rgb(15, 17, 17);">Dumb Luck</em><span style="color: rgb(15, 17, 17);">&nbsp;is the first translation of a major work by Vu Trong Phung, arguably the greatest Vietnamese writer of the twentieth century. The novel''s clever plot, richly drawn characters and humorous tone and its preoccupation with sex, fashion and capitalism will appeal to a wide audience. It will appeal to students and scholars of Vietnam, comparative literature, colonial and postcolonial studies, and Southeast Asian civilization.</span></p><p>Vu Trong Phung died in Hanoi, in 1939 at the age of twenty-seven. He is the author of at least eight novels, seven plays, and several other works of fiction in addition to&nbsp;<em style="color: rgb(15, 17, 17);">Dumb Luck</em><span style="color: rgb(15, 17, 17);">.</span></p><p>Peter Zinoman is Associate Professor of Southeast Asian History, University of California, Berkeley. Nguyen Nguyet Cam is Vietnamese Language Instructor, University of California, Berkeley.</p>', 23, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (41, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F64d5cf66-11db-4244-af0a-29b9ec3ff5e9%2F51T0XPK9C7L.jpg?alt=media&token=4ac11f39-c6ce-4c86-91a3-b9f847a5d8a0', N'Dế mèn phưu lưu ký', N'Tô Hoài', N'Hoai To', CAST(N'1941-01-01T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgba(0, 0, 0, 0.8);">Lorem ipsum dolor sit amet consectetur adipiscing elit, commodo aenean nulla tristique pellentesque velit taciti fringilla, vestibulum interdum augue odio lacus aptent. Interdum lacus pellentesque massa a in, felis suspendisse rhoncus sed convallis, eros ornare eu natoque. Ridiculus vestibulum ad iaculis dis fermentum eu ut ornare suscipit platea orci, nostra urna eget nisi magna porttitor nisl phasellus pellentesque vitae nec montes, accumsan taciti vivamus maecenas inceptos eros at justo neque rutrum. Ultrices enim varius hac lectus, ullamcorper erat tincidunt, turpis conubia sagittis. Torquent primis cubilia dapibus vehicula metus blandit sed mollis scelerisque, urna nunc nam netus erat ante gravida. Dis commodo auctor eu pretium aliquam luctus praesent, consequat ridiculus phasellus nam metus per egestas, euismod etiam ut viverra eros tempor. Condimentum hac aenean vel nunc taciti porttitor litora parturient est tristique, habitasse natoque eu laoreet nostra vitae mi mattis massa, non inceptos neque lectus feugiat duis faucibus nec primis.</span></p>', 3.14, 99)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (42, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F57a21192-349b-450e-babe-aa740d715ddc%2F51udpfVAWBL._SX309_BO1%2C204%2C203%2C200_.jpg?alt=media&token=2cafca4f-2787-4629-bf87-5acc410ee327', N'Tắt đèn', N'Ngô Tất Tố', N'Tat To', CAST(N'2016-06-15T00:00:00.0000000' AS DateTime2), N'<p>"According to my prophecy, the book Turning off the lights has to live longer, longer than some contemporary writers today. Sister Dau is the author Ngo Tat To incarnated. Sister Dau is a bright spot. If you compare the whole story of Turning Off the Lights to a cluster of trees, then Sister Dau is the root and top of the branch, and it was Sister Dau who raised the wind and shook the whole hyacinth tree. Tuan - 1962 "Sister Dau is a typical character loved by readers. And the person who loves her the most is Ngo Tat To. Amidst so many evils and even scenes of injustice and injustice in the old countryside of Vietnam, Ngo Tat To wholeheartedly protected a woman, Sister Dau, Many times, Sister Dau was put in a dangerous situation, possibly humiliated, but Ngo Tat To kept Sister Dau''s integrity and integrity. dignity, not torment." - Ha Minh Duc - 1999 Welcome to read.</p>', 22, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (43, 3, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F8eaf0adc-3c73-407f-a1bb-6832ea71057f%2F51jlbukZMYL._SY346_.jpg?alt=media&token=e8f22fd7-1934-49ac-84c6-751c4eaae7c5', N'Love, Theoretically Kindle Edition', N' Ali Hazelwood', N' Ali Hazelwood', CAST(N'2022-02-01T00:00:00.0000000' AS DateTime2), N'<p><strong style="color: rgb(15, 17, 17);">"The reigning queen of STEM romance."—<em>The Washington Post</em></strong></p><p><br></p><p><strong style="color: rgb(15, 17, 17);">An Indie Next and Library Reads Pick!</strong></p><p><br></p><p><strong style="color: rgb(15, 17, 17);">Rival physicists collide in a vortex of academic feuds and fake dating shenanigans in this delightfully STEMinist romcom from the&nbsp;<em>New York Times</em>&nbsp;bestselling author of&nbsp;<em>The Love Hypothesis</em>&nbsp;and&nbsp;<em>Love on the Brain</em>.</strong></p><p><span style="color: rgb(15, 17, 17);">&nbsp;</span></p><p><span style="color: rgb(15, 17, 17);">The many lives of theoretical physicist Elsie Hannaway have finally caught up with her. By day, she’s an adjunct professor, toiling away at grading labs and teaching thermodynamics in the hopes of landing tenure. By&nbsp;</span><em style="color: rgb(15, 17, 17);">other</em><span style="color: rgb(15, 17, 17);">&nbsp;day, Elsie makes up for her non-existent paycheck by offering her services as a fake girlfriend, tapping into her expertly honed people-pleasing skills to embody whichever version of herself the client needs.</span></p><p>&nbsp;</p><p>Honestly, it’s a pretty sweet gig—until her carefully constructed Elsie-verse comes crashing down. Because Jack Smith, the annoyingly attractive and arrogant older brother of her favorite client, turns out to be the cold-hearted experimental physicist who ruined her mentor’s career and undermined the reputation of theorists everywhere. And he’s the same Jack Smith who rules over the physics department at MIT, standing right between Elsie and her dream job.</p><p>&nbsp;</p><p>Elsie is prepared for an all-out war of scholarly sabotage but…those long, penetrating looks? Not having to be anything other than her true self when she’s with him? Will falling into an experimentalist’s orbit finally tempt her to put her most guarded theories on love into practice?</p>', 11, 94)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (44, 3, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F8929792a-4487-4217-8bbc-b12a474442c0%2F51KEmXDz74L.jpg?alt=media&token=004a2a7f-f2d8-49b9-a3e4-395f914f785b', N'We Could Be So Good', N' Cat Sebastian', N' Cat Sebastian', CAST(N'2021-10-12T00:00:00.0000000' AS DateTime2), N'<p><strong>Casey McQuiston meets&nbsp;<em>The Seven Husbands of Evelyn Hugo&nbsp;</em>in this mid-century rom-dram about a scrappy reporter and a newspaper mogul’s son.</strong></p><p><strong>“A spectacularly talented writer!” —Julia Quinn</strong></p><p><strong>“This historical romance is billed as being ‘for&nbsp;<em>Newsies</em>&nbsp;shippers,’ and it absolutely delivers.” —Dahlia Adler, Buzzfeed Books</strong></p><p>Nick Russo has worked his way from a rough Brooklyn neighborhood to a reporting job at one of the city’s biggest newspapers. But the late 1950s are a hostile time for gay men, and Nick knows that he can’t let anyone into his life. He just never counted on meeting someone as impossible to say no to as Andy.</p><p>Andy Fleming’s newspaper-tycoon father wants him to take over the family business. Andy, though, has no intention of running the paper. He’s barely able to run his life—he’s never paid a bill on time, routinely gets lost on the way to work, and would rather gouge out his own eyes than deal with office politics. Andy agrees to work for a year in the newsroom, knowing he’ll make an ass of himself and hate every second of it.</p><p>Except, Nick Russo keeps rescuing Andy: showing him the ropes, tracking down his keys, freeing his tie when it gets stuck in the ancient filing cabinets. Their unlikely friendship soon sharpens into feelings they can’t deny. But what feels possible in secret—this fragile, tender thing between them—seems doomed in the light of day. Now Nick and Andy have to decide if, for the first time, they’re willing to fight.</p>', 18, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (45, 3, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F487234ee-7c7b-425f-aeed-d9005c14fb2a%2F51zXVAn4NJL.jpg?alt=media&token=95047a28-153d-4248-b593-0b8231682b03', N'If Only It Were True ', N' Marc Levy ', N' Marc Levy ', CAST(N'2023-03-15T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Arthur and Lauren are in love. They even live together. Well, it’s not exactly that simple.</span></p><p><span style="color: rgb(15, 17, 17);">Lauren is a ghost, but she’s in love with Arthur, the only one who can see her. But this isn’t a ghost story, because Lauren isn’t really dead. You see, her body is in a coma across town, and since nobody can see her she’s gone to back to live in her apartment. The one Arthur has just moved into.</span></p><p><span style="color: rgb(15, 17, 17);">Like I said, it’s complicated.</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">“A romantic comedy full of emotion and unexpected twists” - Livres Hebdo</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">“An easy, feel-good page turner with film-like qualities and loveable characters who inspire a gamut of emotions…” - Daily Express</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">One of France’s bestselling authors, Marc Levy’s novels have been translated into 49 languages and over 40 million copies of his books have been sold worldwide. In 2005, If Only It Were True was adapted to film as Just Like Heaven (Dreamworks), produced by Steven Spielberg, starring Mark Ruffalo and Reese Witherspoon.</span></p>', 5, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (46, 6, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fcd75c90b-f36d-4627-a1ec-e4703f58c247%2F41Dns9XWfrL._SX327_BO1%2C204%2C203%2C200_.jpg?alt=media&token=52769a36-1221-4a4c-a075-5dd292e4d358', N'How to Win Friends and Influence People: Updated For the Next Generation of Leaders', N'Dale Carnegie', N'Simon & Schuster', CAST(N'2022-05-12T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Carnegie’s rock-solid, experience-tested advice has remained relevant for generations because he addresses timeless questions about the art of getting along with people.&nbsp;</span><em style="color: rgb(15, 17, 17);">How to Win Friends and Influence People&nbsp;</em><span style="color: rgb(15, 17, 17);">teaches you:</span></p><p>-How to communicate effectively</p><p>-How to make people like you</p><p>-How to increase your ability to get things done</p><p>-How to get others to see your side</p><p>-How to become a more effective leader</p><p>-How to successfully navigate almost any social situation</p><p>-And so much more!</p>', 26, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (47, 6, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Fe7b5ac8d-a9a8-4191-ac12-bd704f4b07b4%2F41xShlnTZTL._SX376_BO1%2C204%2C203%2C200_.jpg?alt=media&token=7f1d6bc8-c125-47b0-8fdb-5f57e90a8fb0', N'Clean Code: A Handbook of Agile Software Craftsmanship', N'Robert C. Martin', N'Pearson', CAST(N'2008-08-01T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.</span></p>', 40, 76)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (48, 6, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F9371c119-fc1c-49db-a013-9525217cb825%2F613YHvY4nCL._SX384_BO1%2C204%2C203%2C200_.jpg?alt=media&token=5ecd427b-f00a-4fdb-8b53-7dcba63648b6', N'Data Structures and Algorithms in Java', N'Michael T. Goodrich', N'Wiley', CAST(N'2014-01-28T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">The design and analysis of efficient data structures has long been recognized as a key component of the Computer Science curriculum. Goodrich, Tomassia and Goldwasser''s approach to this classic topic is based on the object-oriented paradigm as the framework of choice for the design of data structures. For each ADT presented in the text, the authors provide an associated Java interface. Concrete data structures realizing the ADTs are provided as Java classes implementing the interfaces.&nbsp;</span></p>', 168, 80)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (49, 1, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2Ff73180b4-86ed-4403-87f6-2c9c2c696560%2F413A2CRqB6L.jpg?alt=media&token=636109ad-2610-4df4-a4e8-7465e8cdcb16', N'Schindler''s List', N'Thomas Keneally', N'Washington Square Press', CAST(N'2020-09-01T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">An “extraordinary” (</span><em style="color: rgb(15, 17, 17);">New York Review of Books</em><span style="color: rgb(15, 17, 17);">) novel based on the true story of how German war profiteer and factory director Oskar Schindler came to save more Jews from the gas chambers than any other single person during World War II. In this milestone of Holocaust literature, Thomas Keneally, author of&nbsp;</span><em style="color: rgb(15, 17, 17);">The Book of Science and Antiquities</em><span style="color: rgb(15, 17, 17);">&nbsp;and&nbsp;</span><em style="color: rgb(15, 17, 17);">The Daughter of Mars</em><span style="color: rgb(15, 17, 17);">, uses the actual testimony of the&nbsp;</span><em style="color: rgb(15, 17, 17);">Schindlerjuden</em><span style="color: rgb(15, 17, 17);">—Schindler’s Jews—to brilliantly portray the courage and cunning of a good man in the midst of unspeakable evil. “Astounding…in this case the truth is far more powerful than anything the imagination could invent” (</span><em style="color: rgb(15, 17, 17);">Newsweek</em><span style="color: rgb(15, 17, 17);">).</span></p>', 18.93, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (50, 2, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F48f9fba4-e257-4a4d-8333-fd62b3e6828a%2F51-oAtmRufL._SX331_BO1%2C204%2C203%2C200_.jpg?alt=media&token=aa3cd514-14f0-4857-912a-10dab66b5d18', N'No Plan B: A Jack Reacher Novel', N'Lee Child', N'Bantam', CAST(N'2023-04-25T00:00:00.0000000' AS DateTime2), N'<p><strong style="color: rgb(15, 17, 17);"><em>NEW YORK TIMES&nbsp;</em>BESTSELLER • The gripping new Jack Reacher thriller from the #1&nbsp;<em>New York Times&nbsp;</em>bestselling authors Lee Child and Andrew Child</strong></p><p><br></p><p>“<strong style="color: rgb(15, 17, 17);"><em>No Plan B</em>&nbsp;is not to be missed. A perfectly plotted, fast-paced thriller, with bigger twists than ever before. It’s no wonder Jack Reacher is everyone’s favorite rebel hero.”—Karin Slaughter</strong></p>', 13.48, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (51, 3, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F3ede300c-0bba-454e-b561-26a6dff4b46d%2F413y9KBGMlL._SY291_BO1%2C204%2C203%2C200_QL40_FMwebp_.webp?alt=media&token=a0a9267b-4bdd-4606-a2f5-0bd615eefec0', N'Crazy Rich Asians', N'Kevin Kwan', N'Anchor', CAST(N'2020-05-26T00:00:00.0000000' AS DateTime2), N'<p><strong style="color: rgb(15, 17, 17);">#1&nbsp;<em>NEW YORK TIMES</em>&nbsp;BESTSELLER • The international sensation that was the basis for Hollywood’s highest grossing romantic comedy in over a decade. • "A&nbsp;<em>Pride and Prejudice</em>-like send-up about an heir bringing his Chinese-American girlfriend home to meet his ancestor-obsessed family.” —<em>People</em></strong></p>', 9.29, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (52, 4, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F503067c3-196d-4160-be09-071881e3d457%2F51YRGGnjrBL._SX321_BO1%2C204%2C203%2C200_.jpg?alt=media&token=789d9287-ac57-4a02-bfe2-ce03bd9c35ee', N'Ender''s Game Graphic Novel', N'Chris Yost', N'Marvel', CAST(N'2013-09-24T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">This graphic novel would be difficult to follow without having seen the movie. But the movie would be pretty difficult to follow without reading the book. The book really is the best way to digest this incredible story. I''ve probably reread Ender''s Game more than any other book. And it''s lead me to read the spin-off sequels and parallel books. But I loved going through the graphic novel version and comparing the visual here with what my imagination created when I read this book as a teenager. I liked how the graphic novel was able to focus on things that the movie had to gloss over. I feel it did more justice to the original story than the movie. But I can appreciate the different perspectives I''m able to get from all three formats. In the end, I''ll reiterate that I would think the graphic novel would be difficult to keep up with without having experience the movie or the book. Don''t substitute this adaptation for the book. But hats off to Chris Yost and Marvel for taking on this series and giving it a new platform on which to be experienced.</span></p>', 229.79, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (53, 5, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F81780a41-7d88-4009-a743-15df8b507c74%2F51Pe5D36rML._SX333_BO1%2C204%2C203%2C200_.jpg?alt=media&token=e4a66a19-b2ae-4a2e-8926-6a4a4cba8599', N'Sapiens: A Brief History of Humankind', N'Yuval Noah Harari', N'Harper', CAST(N'2015-05-05T00:00:00.0000000' AS DateTime2), N'<p><strong>Official U.S. edition with full color illustrations throughout.</strong></p><p><strong><em>New York Times</em>&nbsp;Bestseller</strong></p><p><strong>A Summer Reading Pick for President Barack Obama, Bill Gates, and Mark Zuckerberg</strong></p><p>From a renowned historian comes a groundbreaking narrative of humanity’s creation and evolution—a #1 international bestseller—that explores the ways in which biology and history have defined us and enhanced our understanding of what it means to be “human.”</p><p>One hundred thousand years ago, at least six different species of humans inhabited Earth. Yet today there is only one—homo sapiens. What happened to the others? And what may happen to us?</p>', 21.49, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [ThumbnailUrl], [Name], [Author], [Publisher], [PublishcationDate], [Description], [Price], [Quantity]) VALUES (54, 8, N'https://firebasestorage.googleapis.com/v0/b/project-5086393183231642537.appspot.com/o/thumbnails%2F02ebd005-6868-4018-97fa-bb6cd178ea51%2F41oRXUrmYEL._SX326_BO1%2C204%2C203%2C200_.jpg?alt=media&token=b99a30cf-64fa-4ec9-8231-c61a7426d515', N'Great Again: How to Fix Our Crippled America', N' Donald J. Trump', N'Threshold Editions; Reprint edition', CAST(N'2016-12-07T00:00:00.0000000' AS DateTime2), N'<p><span style="color: rgb(15, 17, 17);">It’s time to bring America back to its rightful owners—the American people.</span></p><p><br></p><p><span style="color: rgb(15, 17, 17);">I’m not going to play the same game politicians have been playing for decades—all talk, no action, while special interests and lobbyists dictate our laws. I am shaking up the establishment on both sides of the political aisle because I can’t be bought. I want to bring America back, to make it great and prosperous again, and to be sure we are respected by our allies and feared by our adversaries.</span></p>', 8.79, 80)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingAddresses] ON 

INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (9, 2, N'Long', N'0888827768', N'Duong Dinh Nghe, Cau Giay', N'Hà Nội', N'Đông Lào')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (10, 2, N'Long', N'0888827768', N'tòa nhà AT, số 9 ngõ 7 đường Lê Đức Thọ, Mỹ Đình, Nam Từ Liêm', N'Hà Nội', N'Việt Nam')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (11, NULL, N'Minh', N'0873673562', N'Area no.20', N'Moon', N'Solar System')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (12, 7, N'Duy Anh', N'01235792003', N'Ngõ 47 phố Nghĩa Tân, Yên Hòa, Cầu Giấy', N'Hà Nội', N'Việt Nam')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (15, NULL, N'abc', N'0123456789', N'abc', N'abc', N'abc')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (16, 16, N'con cac', N'0454545', N'ưbiewh', N'ưebf', N'ewfnwjef')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (17, 18, N'Hung', N'123', N'Gam cau', N'Ha Noi', N'Viet Nam')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (18, 19, N'asdasd', N'123123123', N'trung quoc', N'cmmb', N'hong kong')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (19, 21, N'minh', N'0936061710', N'ha dong', N'ha noi', N'ha noi')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (20, 22, N'woala', N'123456789', N'Hawaii', N'NewYork', N'IS')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (21, 15, N'Duy', N'0123456789', N'Yen Hoa, Cau Giay', N'Ha Noi', N'Viet Nam')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (22, 23, N'Thang Do', N'012345678', N'Nghia Tan, Cau Giay', N'Ha Noi', N'Vietnam')
INSERT [dbo].[ShippingAddresses] ([Id], [CustomerId], [Name], [Phone], [Address], [City], [Country]) VALUES (23, 24, N'Thang Do', N'0386199014', N'Vietnam', N'Ha Noi', N'Vietnam')
SET IDENTITY_INSERT [dbo].[ShippingAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([Id], [AccountId], [Name], [Phone], [Address]) VALUES (1, 3, N'Nam', N'0123579200', N'Cau Giay - Ha Noi')
INSERT [dbo].[Staffs] ([Id], [AccountId], [Name], [Phone], [Address]) VALUES (4, 6, N'Long bán sách', N'0888827768', N'Cau Giay, Ha Noi')
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_ShippingAddressId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_ShippingAddressId] ON [dbo].[Orders]
(
	[ShippingAddressId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_StaffId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_StaffId] ON [dbo].[Orders]
(
	[StaffId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShippingAddresses_CustomerId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_ShippingAddresses_CustomerId] ON [dbo].[ShippingAddresses]
(
	[CustomerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Staffs_AccountId]    Script Date: 23/06/15 10:57:37 ******/
CREATE NONCLUSTERED INDEX [IX_Staffs_AccountId] ON [dbo].[Staffs]
(
	[AccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Accounts_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Accounts_CustomerId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts_CustomerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ShippingAddresses_ShippingAddressId] FOREIGN KEY([ShippingAddressId])
REFERENCES [dbo].[ShippingAddresses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_ShippingAddresses_ShippingAddressId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Staffs_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Staffs_StaffId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ShippingAddresses]  WITH CHECK ADD  CONSTRAINT [FK_ShippingAddresses_Accounts_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[ShippingAddresses] CHECK CONSTRAINT [FK_ShippingAddresses_Accounts_CustomerId]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Accounts_AccountId]
GO
/****** Object:  StoredProcedure [dbo].[PRO_Newly_Products]    Script Date: 23/06/15 10:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_Newly_Products]
AS
BEGIN
SELECT TOP 6 p.Id, p.Name, p.Price, p.ThumbnailUrl, p.Author FROM [Products] AS p ORDER BY (p.PublishcationDate) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_OrderCalculating]    Script Date: 23/06/15 10:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_OrderCalculating]
AS
BEGIN
SELECT o.Status, COUNT(o.Id) FROM [Orders] AS o 
GROUP BY o.Status
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_Selling_Products]    Script Date: 23/06/15 10:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_Selling_Products]
AS
BEGIN
SELECT TOP 6 p.Id, p.Name, p.Price, p.ThumbnailUrl,p.Author FROM [Products] AS p
INNER JOIN [OrderItems] AS oi ON p.Id = oi.ProductId
INNER JOIN [Orders] AS o ON oi.OrderId = o.Id 
WHERE o.Status = 'Delivered'
GROUP BY p.Id, p.Name, p.Price, p.ThumbnailUrl, p.Author HAVING SUM(oi.Quantity) > 8 ORDER BY SUM(oi.Quantity) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_StaffOrders]    Script Date: 23/06/15 10:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_StaffOrders] (@status nvarchar(MAX))
AS
BEGIN
SELECT s.AccountId, s.Name, COUNT(o.Id) AS Quantity FROM [Orders] AS o 
INNER JOIN [Staffs] AS s 
ON o.StaffId = s.Id
WHERE o.Status = @status
GROUP BY s.AccountId, s.Name
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_TotalRevenue]    Script Date: 23/06/15 10:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_TotalRevenue] (@status nvarchar(MAX))
AS
BEGIN
SELECT MONTH(o.Date) AS month, SUM(p.Price * oi.Quantity) AS Revenue, COUNT(o.Id) as number FROM [Orders] AS o
INNER JOIN [OrderItems] AS oi ON o.Id = oi.OrderId
INNER JOIN [Products] AS p ON oi.ProductId = p.Id
WHERE ABS(DATEDIFF(MONTH, o.Date, GETDATE())) <= 2 AND o.Status = @status
GROUP BY MONTH(o.Date)
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_UserCalculating]    Script Date: 23/06/15 10:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_UserCalculating]
AS
BEGIN
SELECT a.Role ,COUNT(a.Id) FROM [Accounts] AS a
GROUP BY a.Role
END
GO
ALTER DATABASE [1670_db] SET  READ_WRITE 
GO
